class UsersController < ApplicationController
  before_action :move_to_index
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :not_update, only: [:edit, :update]
  before_action :check_guest, only: [:update, :destroy]
  
  def show
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
  def set_user
    @user = User.find(params[:id])
  end
  def not_update
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(@user)
    end
  end
  def user_params
    params.require(:user).permit(:nickname, :email, :introduction, :prefecture_id, :generation_id, :gender_id)
  end
end
