class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :sales_status_id, numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :scheduled_delivery_id, numericality: { other_than: 1 }  
  validates :price, numericality: { other_than: 1 } 


end

