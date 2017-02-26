class RoomsController < ApplicationController
  before_action :set_user_and_room, except: [:new, :index, :create]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @user = User.find(params[:user_id])
    @room = @user.rooms.create(room_params)
    redirect_to user_room_path(@user, @room)
  end

  def show
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_user_and_room
    @user = User.includes(:rooms).find(params[:user_id])
    @room = @user.rooms.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url)
  end
end
