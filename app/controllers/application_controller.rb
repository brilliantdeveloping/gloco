class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?
  
  def landing
  end
  
  protected
    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :remember_me)}
      devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)}
    end
end