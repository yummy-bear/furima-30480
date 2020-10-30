class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end


 
  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid? 
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end


  
 
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:number, :exp_month, :exp_year, :cvc, :zip_code, :delivery_area_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_address_params[:token],
        currency: 'jpy'
      )
  end


end
