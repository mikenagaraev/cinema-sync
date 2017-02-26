class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    current_user.rooms.create(room_params)
  end

  def show
    set_room
  end

  def destroy
    set_room
    @room.destroy
    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url)
  end
end
