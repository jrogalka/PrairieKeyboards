class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :province_id, :shipping_address) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, :province_id, :shipping_address) }
  end
end
