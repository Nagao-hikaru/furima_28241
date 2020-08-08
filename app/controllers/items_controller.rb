class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :category_id, :burden_id, :area_id, :delivery_day_id).merge(user_id: current_user.id)
  end

  def set_message
    @item = Item.find(params[:id])
  end
end
