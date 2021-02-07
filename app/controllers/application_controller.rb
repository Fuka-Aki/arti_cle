class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  def check_guest
    email = @user.email || params[:user][:email].downcase
    redirect_to user_path(@user.id), notice: 'ゲストユーザーの変更・削除はできません。' if email == 'guest@sample.com'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
