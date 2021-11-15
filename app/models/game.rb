class Game < ApplicationRecord
  has_many :game_sessions, dependent: :destroy
  has_many :game_review, dependent: :destroy
  has_one_attached :photo
end
