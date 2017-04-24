class Room < ApplicationRecord
  belongs_to :user

  validates_presence_of :title

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :messages, dependent: :destroy
  has_one :video, dependent: :destroy
end
