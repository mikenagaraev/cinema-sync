class VideosChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'videos'
  end
end
