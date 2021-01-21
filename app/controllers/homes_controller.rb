class HomesController < ApplicationController
  before_action :move_to_index
  def index; end

  def move_to_index
    redirect_to rooms_path if user_signed_in?
  end
end
