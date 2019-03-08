class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:school])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:intro])
  end

  private
  def counts(user)
    @count_topics = user.topics.count
    @count_goods = user.good_topics.count
  end
end
