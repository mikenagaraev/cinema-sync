class Video < ApplicationRecord
  belongs_to :room

  validates_presence_of :title
  validates_presence_of :link
end
