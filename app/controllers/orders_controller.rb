class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    # 注文一覧を表示するためのアクション
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
   
  end


  

  def create
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
       @order_shipment.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:item_id,:postal_code, :city, :addresses, :prefecture_id, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
