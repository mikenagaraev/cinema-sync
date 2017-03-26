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
    redirect_to user_room_path(current_user)
  end

  def show
    set_user
    @room = @user.room
  end

  #def update
  #  set_user
  #  @room.update_attributes(room_params)
  #  respond_to do |format|
  #    format.html
  #    format.js
  #  end
  #end

  def destroy
    set_user
    @room.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def room_params
    params.require(:room).permit(:user_id, :title, :video_url, :video_title)
  end
end
