class RoomsController < ApplicationController
  before_action :move_to_index
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:artist_name, :genre_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
