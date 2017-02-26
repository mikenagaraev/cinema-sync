class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :email, :password, :password_confirmation, :presence => true

  has_many :rooms, dependent: :destroy
end
