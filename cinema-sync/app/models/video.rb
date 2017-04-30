class Video < ApplicationRecord
  belongs_to :room

  YOUTUBE_VIDEO_REGEX = /(https?):\/\/(www.)?youtube.com\/((watch\?v=|embed)(.{8,14}))/

  before_save :create_iframe_link

  validates_presence_of :title
  validates_format_of :link, with: YOUTUBE_VIDEO_REGEX

  def create_iframe_link
    video_hash = link.match(YOUTUBE_VIDEO_REGEX)[5]
    self.link = "https://www.youtube.com/embed/#{video_hash}"
  end

end
