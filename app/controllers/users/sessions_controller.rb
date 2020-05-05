# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :user_flag_check

  private

  def user_flag_check
    if user_signed_in? && (current_user.user_flag == false)
      sign_out
      flash[:alert] = "現在利用者でないためログインできません。管理者に問い合わせてください。"
      redirect_to new_user_session_path
    end
  end
end
