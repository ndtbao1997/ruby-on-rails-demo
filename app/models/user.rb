class User < ApplicationRecord
  has_many :user_role_details
  has_many :roles, through: :user_role_details
  has_many :evaluates
  has_many :products, through: :evaluates
  has_many :bookings
  has_secure_password

  def self.authenticate(user_name, password)
    user = find_by(user_name: user_name)
    return user if user && user.authenticate(password)
    nil
  end
end
