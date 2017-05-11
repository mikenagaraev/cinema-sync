class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :email, :password, :password_confirmation, presence: true

  has_one :room, dependent: :destroy
  has_many :messages, dependent: :destroy

  def admin?
    role == 'admin'
  end
end
