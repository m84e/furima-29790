class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    if @item.user == current_user || @item.order.present?
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
       @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
    def order_address_params
      params.require(:order_address).permit(:postal_code, :prefectures_id, :city, :house_num, :build_name, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end