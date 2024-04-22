class ProductsRestController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    products = Product.kept
    render json: products
  end

  def delete
    product = Product.find_by(id: params[:id])
    if product
      product.discard
      render json: { message: 'Product deleted successfully' }, status: :ok
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  def update
    product = Product.find_by(id: params[:id])

    if product
      if product.update(product_params)
        render json: { message: "Update thành công" }, status: :ok
      else
        render json: { error: product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Sản phẩm không tồn tại" }, status: :not_found
    end
  end

  private

  def product_params
    params.permit(:name, :description, :price, :product_type_id)
  end

  private

  # def authenticate_user!
  #   header = request.headers['Authorization']
  #   token = header.split(' ').last if header
  #
  #   begin
  #     decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
  #     @current_user = User.find(decoded_token[0]['user_id'])
  #   rescue JWT::DecodeError
  #     render json: { error: 'Invalid token' }, status: :unauthorized
  #   end
  # end
end
