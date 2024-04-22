class BookingDetail < ApplicationRecord
  belongs_to :product_detail
  belongs_to :booking
end
