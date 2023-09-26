class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :same_sentence
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create 
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def same_sentence
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end