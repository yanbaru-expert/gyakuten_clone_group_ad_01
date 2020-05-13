# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:update]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
