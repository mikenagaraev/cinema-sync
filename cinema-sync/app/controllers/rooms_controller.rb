class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end

  def create
    set_user
    @user.create_room(room_params)
    redirect_to user_room_path
  end

  def show
    set_user
    @room = @user.room
  end

  def destroy
    set_user
    @room = @user.room
    @room.destroy
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url)
  end
end
