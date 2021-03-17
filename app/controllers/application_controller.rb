class ApplicationController < ActionController::API
  include ActionController::Cookies
  # include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exceptions

  include ExceptionHandler
end
