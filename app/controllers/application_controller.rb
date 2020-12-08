class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  helper_method :cart
  add_breadcrumb "Home", :root_path

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :province_id, :shipping_address) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, :province_id, :shipping_address) }
  end

  private

  def initialize_session
    # Initialize shopping cart
    session[:shopping_cart] ||= []
  end

  def cart
    # Return an array of hashes containing products and their quantity
    session[:shopping_cart]
  end
end
