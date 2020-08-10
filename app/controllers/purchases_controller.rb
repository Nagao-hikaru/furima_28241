class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :forbit_purchase, only: [:index]
  before_action :forbit_purchased_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    # @purchase = Purchase.new
  end


  def create
    @item = Item.find(params[:item_id])

    @item_address = ItemAddress.new(purchase_params)

    if @item_address.valid?
      pay_item
      binding.pry
      @item_address.save
      return redirect_to root_path
    else
      render 'index'
    end
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

  def purchase_params
    params.permit(:item_id, :token, :postal_code, :city, :area_id, :address, :tel, :user_id).merge(user_id: current_user.id)
  end



  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
