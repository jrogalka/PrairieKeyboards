class Province < ApplicationRecord
  has_many :customers, dependent: :nullify

  validates :name, :abbreviation, :pst, :gst, presence: true
end
