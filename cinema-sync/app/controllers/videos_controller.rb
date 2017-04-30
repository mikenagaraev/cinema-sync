class VideosController < ApplicationController

  before_action :set_user_room
  before_action :set_video, except: [:new, :create]

  YOUTUBE_VIDEO_REGEX = /(https?):\/\/(www.)?youtube.com\/watch\?v=(.{8,14})/

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(videos_params.merge(room_id: @room.id))
    redirect_to user_room_path(@user)
  end

  def update
    @video.update_attributes(videos_params)
    redirect_to user_room_path(@user)
  end

  def destroy
    @video.destroy
    redirect_to user_room_path(@user)
  end

  private

  def videos_params
    params.require(:video).permit(:title, :link)
  end

  def set_user_room
    @user = User.find(params[:user_id])
    @room = @user.room
  end

  def set_video
    @video = @room.video
  end

end
