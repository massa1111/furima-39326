class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :category_id, numericality: { other_than: 1 } 

end

