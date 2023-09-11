class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :quality_id, :delivery_fee_id, :prefecture_id, :processing_time_id).merge(user_id: current_user.id)
end
