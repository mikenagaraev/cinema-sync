class RoomsController < ApplicationController
  before_action :set_user, except: [:new, :index, :create]
  before_action :set_room, except: [:new, :index, :create]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.rooms.create(room_params)
  end

  def show
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.includes(:rooms).find(params[:user_id])
  end

  def set_room
    @room = @user.rooms.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url)
  end
end
