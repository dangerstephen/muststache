class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?

  protected
  def configure_permitted_paramters
    added_attrs = [:avatar, :fullname, :email, :password, :password_confirmation, :remember_me]
    uppdate_attrs = [:avatar, :fullname]

    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: uppdate_attrs
  end

end
