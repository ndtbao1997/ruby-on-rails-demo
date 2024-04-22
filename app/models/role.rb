class Role < ApplicationRecord
  has_many :user_role_details
  has_many :users, through: :user_role_details
end
