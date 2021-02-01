class RoomsController < ApplicationController
  before_action :move_to_index, only:[:index, :new, :create]
  def index
    @rooms = Room.all.order('artist_name ASC')
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

  def join
    @room = Room.find(params[:id])
    if !@room.users.include?(current_user)
      @room.users << current_user
      redirect_to room_messages_path(@room)
    else
      redirect_to room_messages_path(@room)
    end
  end

  private

  def room_params
    params.require(:room).permit(:artist_name, :genre_id, :image, user_ids:[])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
