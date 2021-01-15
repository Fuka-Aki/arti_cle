class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_guest
    email = @user.email || params[:user][:email].downcase
    if email == 'guest@sample.com'
      redirect_to user_path(@user.id), alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
