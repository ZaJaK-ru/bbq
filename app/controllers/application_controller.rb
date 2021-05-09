class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :current_user_can_subscibe?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name, :password, :password_confirmation, :email]
    )
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user ||
        (model.try(:event).present? && model.event.user == current_user))
  end

  def current_user_can_subscibe?(event)
    current_user != event.user
  end
end
