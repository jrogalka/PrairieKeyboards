class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
