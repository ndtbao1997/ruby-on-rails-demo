module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ExceptionHandler::MissingToken, with: :missing_token
    rescue_from JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError, with: :handle_jwt_errors
  end

  class MissingToken < StandardError; end
  class DecodeError < StandardError; end  # Thêm dòng này để định nghĩa DecodeError

  private

  def missing_token(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def record_not_found(e)
    render json: { error: e.message }, status: :not_found
  end

  def handle_jwt_errors(exception)
    render json: { error: exception.message }, status: :unauthorized
  end
end
