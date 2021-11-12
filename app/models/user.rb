class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_reviews
  has_many :game_reviews
  has_many :lobbies
  has_many :sessions
  has_one_attached :photo
end
