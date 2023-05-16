class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    # 注文一覧を表示するためのアクション
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
   
  end


  

  def create
    # 注文を作成するためのアクション
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
    params.require(:order_shipment).permit(:postal_code, :city, :addresses, :building, :phone_number, :order).merge(user_id: current_user.id)
  end
end
