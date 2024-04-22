require 'jwt'

class UserRestController < ApplicationController
  skip_before_action :verify_authenticity_token

  def authenticate
    user = User.find_by(user_name: params[:user_name])

    if user && user.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end
end
