class ApplicationController < ActionController::Base
  # 全ページをログイン必須とする
  before_action :authenticate_user!
  before_action :set_host

  private

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
end
