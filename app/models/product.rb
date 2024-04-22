class Product < ApplicationRecord
  belongs_to :product_type
  has_many :product_details
  has_many :evaluates
  has_many :users, through: :evaluates
end
