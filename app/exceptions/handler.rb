module ExceptionHandler
  extend ActiveSupport::Concern

  class MissingToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ExceptionHandler::MissingToken, with: :missing_token
  end

  private

  def missing_token(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def record_not_found(e)
    render json: { error: e.message }, status: :not_found
  end
end
