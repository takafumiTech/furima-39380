class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :same_sentence
  before_action :move_to_index
  before_action :no_edit_soldout

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def same_sentence
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return unless current_user.id == @item.user_id
    redirect_to root_path
  end

  def no_edit_soldout
    return unless @item.order.present?
    redirect_to root_path
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
