class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :products, through: :order_details

  validates :total, :order_address, :order_email, :pst, :gst, presence: true
end
