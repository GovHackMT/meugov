class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |sign_up_params|
      sign_up_params.permit(
        :name, :email, :password, :password_confirmation
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |account_update_params|
      account_update_params.permit(
        :name, :email, :password, :password_confirmation
      )
    end
  end
end
