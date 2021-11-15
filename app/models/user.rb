class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_reviews, foreign_key: :recepient_id, dependent: :destroy
  has_many :game_reviews, dependent: :destroy
  has_many :lobbies, dependent: :destroy
  has_many :game_sessions, dependent: :destroy
  has_one_attached :photo
end
