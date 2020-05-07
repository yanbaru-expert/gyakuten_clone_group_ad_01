class ApplicationController < ActionController::Base
  # 全ページをログイン必須とする
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, only: [:update]

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
