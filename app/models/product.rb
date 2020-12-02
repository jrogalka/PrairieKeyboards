class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details

  has_one_attached :image

  validates :name, :sku, :price, presence: true
  validates :sku, uniqueness: true
  validates :price, numericality: { only_integer: true }
end
