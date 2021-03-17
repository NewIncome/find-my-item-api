module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      # json_response({ message: e.message }, :not_found)
      render json: { message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      # json_response({ message: e.message }, :unprocessable_entity)
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotUnique do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end
end
