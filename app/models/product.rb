class Product < ApplicationRecord
  has_many_attached :images
  has_many :order_items

  validates :name, :price, :description, presence: true
end
