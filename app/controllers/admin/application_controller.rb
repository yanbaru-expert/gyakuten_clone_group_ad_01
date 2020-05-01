# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :user_signed_check, :my_authenticate_admin

    # ログインしていない場合、ルートページにリダイレクト
    def user_signed_check
      redirect_to root_path unless user_signed_in?
    end

    # 管理者でない場合、ルートページにリダイレクト
    def my_authenticate_admin
      redirect_to root_path unless current_user.admin?
    end

  end
end
