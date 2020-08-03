class ItemsController < ApplicationController
  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :category_id, :burden_id, :area_id, :delivery_day_id ).merge(user_id: current_user.id)
  end
end
