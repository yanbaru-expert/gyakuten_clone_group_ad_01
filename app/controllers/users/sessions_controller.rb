# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    if !current_user.nil?
      if current_user.user_flag == false
        sign_out
        flash[:alert] = "現在利用者でないためログインできません。管理者に問い合わせてください。"
        redirect_to new_user_session_path
      else
        flash[:notice] = "ログインしました。"
        redirect_to root_path
      end
    else
      flash[:alert] = "メールアドレスまたはパスワードが違います。"
      redirect_to new_user_session_path
    end
  end
end
