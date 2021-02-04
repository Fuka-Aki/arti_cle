class MessagesController < ApplicationController
  before_action :set_message, only: %i[index create]

  def index
    @user = @room.user_id
    @messages = @room.messages.includes(:user).order(:id)
    @message = current_user.messages.build
  end

  def create
    @user = current_user
    @message = Message.create!(message_params)
    ActionCable.server.broadcast 'message_channel', content: @message, user: @user,
                                                    time: @message.created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end

  def set_message
    @room = Room.find(params[:room_id])
  end
end
