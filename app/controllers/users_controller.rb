class UsersController < ApplicationController
  before_action :move_to_index

  def move_to_index
    redirect_to rooms_path if user_signed_in?
  end
end
