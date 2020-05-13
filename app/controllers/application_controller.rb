class ApplicationController < ActionController::Base
  # 全ページをログイン必須とする
  before_action :authenticate_user!
  before_action :set_host
  before_action :configure_permitted_parameters, only: [:update], if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
end
