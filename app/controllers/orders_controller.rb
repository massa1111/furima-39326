class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  before_action :check_item_availability, only:  [:index, :create]

  def index
    @order_shipment = OrderShipment.new
   end


  

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
       @order_shipment.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_item_availability   
    if user_signed_in? && order_exists? && current_user != @item.user
      redirect_to root_path
    elsif order_exists?
      redirect_to root_path
    end
  end


  def order_exists?
    Order.exists?(item_id: @item.id)
  end
 


  def order_params
    params.require(:order_shipment).permit(:item_id,:postal_code, :city, :addresses, :prefecture_id, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  
end
