class RoomsController < ApplicationController
  before_action :move_to_index, only: %i[index new create search]
  before_action :set_room, only: %i[edit update destroy]
  before_action :set_rooms, only: %i[index pops rock dance jazz raten classic march world vocal_music japanese_music a_cappella]
  before_action :ranking_artist, only: %i[index search]

  def index
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

  def edit; end

  def update
    if @room.update(room_params)
      redirect_to room_messages_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
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

  def search
    @rooms = Room.search(params[:keyword]).order(artist_name: :ASC).page(params[:page]).per(9)
  end

  def pops
    @pops_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 1).order('count(room_id) desc').limit(3)
  end

  def rock
    @rock_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 2).order('count(room_id) desc').limit(3)
  end

  def dance
    @dance_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 3).order('count(room_id) desc').limit(3)
  end

  def jazz
    @jazz_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 4).order('count(room_id) desc').limit(3)
  end

  def raten
    @raten_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 5).order('count(room_id) desc').limit(3)
  end

  def classic
    @classic_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 6).order('count(room_id) desc').limit(3)
  end

  def march
    @march_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 7).order('count(room_id) desc').limit(3)
  end

  def world
    @world_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 8).order('count(room_id) desc').limit(3)
  end

  def vocal_music
    @vocal_music_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 9).order('count(room_id) desc').limit(3)
  end

  def japanese_music
    @japanese_music_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 10).order('count(room_id) desc').limit(3)
  end

  def a_cappella
    @a_cappella_rank = Room.joins(:favorites).group("favorites.room_id").where(genre_id: 11).order('count(room_id) desc').limit(3)
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

  def set_rooms
    @rooms = Room.all.order(artist_name: :ASC).page(params[:page]).per(9)
  end

  def ranking_artist
    @all_ranks = Room.find(Favorite.group(:room_id).order('count(room_id) desc').limit(3).pluck(:room_id))
  end
end
