class RoomsController < ApplicationController
  before_action :move_to_index, only: %i[index new create]
  before_action :set_room, only: %i[edit update]

  def index
    @rooms = Room.all.order(artist_name: :ASC).page(params[:page]).per(9)
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

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_messages_path(@room)
    else
      render :edit
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
    params.require(:room).permit(:artist_name, :genre_id, :image, user_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
  def set_room
    @room = Room.find(params[:id])
  end
end
