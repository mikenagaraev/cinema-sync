class RoomsController < ApplicationController
  before_action :set_user, except: [:index, :new]
  before_action :set_room, except: [:index, :new, :create]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @user.create_room(room_params)
    redirect_to user_room_path(current_user)
  end

  def show
  end

  def update
    @room.update_attributes(room_params)
    redirect_to user_room_path
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_room
    @room = @user.room
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url, :video_title)
  end
end
