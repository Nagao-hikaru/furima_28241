class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :forbit_purchase, only: [:index]
  before_action :forbit_purchased_item, only: [:index]
  def index
    @item = Item.find(params[:item_id])
  end

  private

  def forbit_purchase
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path 
    end
  end

  def forbit_purchased_item
    @item = Item.find(params[:item_id])
    if @item.purchase
      redirect_to root_path
    end
  end
end
