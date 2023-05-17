FactoryBot.define do
  factory :order_shipment do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    addresses { '1-1' }
    phone_number { '09012345678' }
    building { '新ビル' }
    
  end
end
