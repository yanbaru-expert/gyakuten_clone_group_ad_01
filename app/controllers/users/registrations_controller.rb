# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to root_path
  end
end
