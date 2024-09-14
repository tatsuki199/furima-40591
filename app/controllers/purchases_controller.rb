class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :redirect_if_seller
  before_action :redirect_if_soldout

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:post_code, :region_id, :municipalities, :street_address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller
    return unless @item.user_id == current_user.id

    redirect_to root_path
  end

  def redirect_if_soldout
    return if @item.purchase.nil?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end
