class VideosController < ApplicationController

  before_action :set_user_room
  before_action :set_video, except: [:new, :create]

  YOUTUBE_VIDEO_REGEX = /(https?):\/\/(www.)?youtube.com\/watch\?v=(.{8,14})/

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(videos_params.merge(room_id: @room.id))
    @video.save(videos_params)
    redirect_to user_room_path(@user, @room)
  end

  def update
    @video.update_attributes(videos_params)
  end

  def destroy
    @video.destroy
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
