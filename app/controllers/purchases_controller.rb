class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :forbit_purchase, only: [:index]
  before_action :forbit_purchased_item, only: [:index]
  before_action :set_message, only: [:index, :create]

  def index
    @item_address = ItemAddress.new
  end

  def create
    @item_address = ItemAddress.new(purchase_params)
    if @item_address.valid?
      pay_item
      @item_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def forbit_purchase
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
  end

  def forbit_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase
  end

  def purchase_params
    params.permit(:item_id, :building, :token, :postal_code, :city, :area_id, :address, :tel, :user_id).merge(user_id: current_user.id)
  end

  def set_message
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
