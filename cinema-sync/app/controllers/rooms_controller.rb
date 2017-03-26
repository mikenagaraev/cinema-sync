class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.create(room_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def update
    @room.update_attributes(room_params)
    redirect_to @room
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url, :video_title)
  end
end
