class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :same_sentence, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :quality_id, :shipping_fee_id,
                                 :prefecture_id, :processing_time_id).merge(user_id: current_user.id)
  end

  def same_sentence
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
