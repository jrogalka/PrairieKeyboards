class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, :description, presence: true
end
