class FavoritesController < ApplicationController
  before_action :set_room, only: %i[create destroy]
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(room_id: params[:room_id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(room_id: @room.id)
    @favorite.destroy
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
