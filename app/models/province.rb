class Province < ApplicationRecord
  has_many :customers

  validates :name, :abbreviation, :pst, :gst, presence: true
  validates :abbreviation, uniqueness: true
end
