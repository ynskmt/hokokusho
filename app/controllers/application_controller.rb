class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  http_basic_authenticate_with :name => ENV['USER'], :password => ENV['PASS'] if Rails.env == "production"

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :user_status_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :user_status_id])
  end
end
