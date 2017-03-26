class MessagesController < ApplicationController
  before_action :set_user_and_room

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.room = @room
    @message.save
  end

  private
  def set_user_and_room
    @user = User.find(params[:user_id])
    @room = @user.room
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
