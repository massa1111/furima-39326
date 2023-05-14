FactoryBot.define do
  factory :item do
    name                   { 'Tシャツ' }
    info                   { '目立ったキズ無し' }
    category_id            { 2 }
    sales_status_id        { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id  { 2 }
    price                  { '9999999'}
  association :user 

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end

end
