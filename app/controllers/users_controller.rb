class UsersController < ApplicationController
  before_action :move_to_index
  def index
  end
  def move_to_index
    if user_signed_in?
      redirect_to rooms_path
    end
  end
end
