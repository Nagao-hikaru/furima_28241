class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :forbit_purchase, only: [:index]
  def index
  end

  private

  def forbit_purchase
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path 
    end
  end
end
