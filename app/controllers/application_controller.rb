class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :bio

    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :bio) }
  end

  def after_sign_in_path_for(resource)
    charts_path
  end
end

