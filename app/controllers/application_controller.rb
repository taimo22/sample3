class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:school])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:intro])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:job])
    devise_parameter_sanitizer.permit(:account_update, keys:[:intro])
  end


end
