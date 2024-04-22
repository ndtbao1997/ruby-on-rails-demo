class ProductDetail < ApplicationRecord
  belongs_to :product
  has_one :product_type, through: :product
  has_many :booking_details
  has_many :bookings, through: :booking_details
end
