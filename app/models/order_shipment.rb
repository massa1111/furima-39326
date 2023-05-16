class OrderShipment
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order
  with_options presence: true do
   validates :item
   validates :user
   validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
   validates :city
   validates :addresses
   validates :building
   validates :phone_number, format: { with: /\A\d{10,11}\z/ }
   validates :order
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  def save
   order = Order.create(item: item, user_id: user_id)
    
   Shipment.create(postal_code: postal_code, city: city, addresses: addresses, building: building, :phone_number: :phone_number, order_id: order.id)
  end
end