class Booking < ApplicationRecord
  belongs_to :user
  has_many :booking_details
  has_many :product_details, through: :booking_details
end
