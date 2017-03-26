class Room < ApplicationRecord
  belongs_to :user
  YOUTUBE_VIDEO_REGEX = /(https?):\/\/(www.)?youtube.com\/watch\?v=(.{8,14})/

  before_update :create_iframe_link

  validates_presence_of :title

  def create_iframe_link
    if video_url
      video_hash = video_url.match(YOUTUBE_VIDEO_REGEX)[3]
      self.video_url = "https://www.youtube.com/embed/#{video_hash}"
    end
  end
  has_many :messages, dependent: :destroy
end
