module Api
  class ProductDetailsController < ApplicationController
    # GET /product_details
    skip_before_action :verify_authenticity_token

    def index
      product_details = ProductDetail.all
      render json: product_details
    end

    def find_all_small_lest
      subquery = ProductDetail.select("MIN(price) AS min_price, product_id")
                              .group("product_id")
      subquery1 = Evaluate.select("AVG(stars) AS avg_stars, product_id")
                          .group("product_id")
      subquery3 = Product.joins("LEFT JOIN (#{subquery1.to_sql}) AS subquery1_alias ON products.id = subquery1_alias.product_id")
                         .select('products.id as product_id, subquery1_alias.avg_stars')

      product_details = ProductDetail.select('product_details.id AS product_detail_id, product_details.*, products.*, subquery3_alias.avg_stars')
                                     .joins(:product)
                                     .joins("INNER JOIN (#{subquery.to_sql}) AS subquery_alias ON (product_details.product_id = subquery_alias.product_id AND product_details.price = subquery_alias.min_price)")
                                     .joins("INNER JOIN (#{subquery3.to_sql}) AS subquery3_alias ON product_details.product_id = subquery3_alias.product_id")
      render json: product_details

    end

    def find_all_by_product_id
      product_id = params[:id]
      subquery1 = Evaluate.select("AVG(stars) AS avg_stars, product_id")
                          .group("product_id")
      subquery3 = Product.joins("LEFT JOIN (#{subquery1.to_sql}) AS subquery1_alias ON products.id = subquery1_alias.product_id")
                         .select('products.id as product_id, subquery1_alias.avg_stars')

      product_details = ProductDetail.select('product_details.id AS product_detail_id, product_details.*, products.*, subquery3_alias.avg_stars')
                                     .joins(:product)
                                     .joins("INNER JOIN (#{subquery3.to_sql}) AS subquery3_alias ON product_details.product_id = subquery3_alias.product_id")
                                     .where(product_id: product_id)
                                     .order("price" )
      render json: product_details
    end

  #   # GET /product_details/:id
  #   def show
  #     # Lấy product detail cụ thể theo id và render ra JSON
  #     product_detail = ProductDetail.find(params[:id])
  #     render json: product_detail
  #   end
  #
  #   # POST /product_details
  #   def create
  #     # Tạo mới một product detail từ params và render ra JSON
  #     product_detail = ProductDetail.new(product_detail_params)
  #
  #     if product_detail.save
  #       render json: product_detail, status: :created
  #     else
  #       render json: product_detail.errors, status: :unprocessable_entity
  #     end
  #   end
  #
  #   # PATCH/PUT /product_details/:id
  #   def update
  #     # Tìm product detail cần cập nhật theo id và cập nhật thông tin từ params
  #     product_detail = ProductDetail.find(params[:id])
  #
  #     if product_detail.update(product_detail_params)
  #       render json: product_detail
  #     else
  #       render json: product_detail.errors, status: :unprocessable_entity
  #     end
  #   end
  #
  #   # DELETE /product_details/:id
  #   def destroy
  #     # Xóa product detail cụ thể theo id
  #     product_detail = ProductDetail.find(params[:id])
  #     product_detail.destroy
  #   end
  #
  #   private
  #
  #   # Phương thức private để chỉ ra các params được cho phép
  #   def product_detail_params
  #     params.require(:product_detail).permit(:name, :description, :price)
  #   end
  end
end
