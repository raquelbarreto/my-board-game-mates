class Game < ApplicationRecord
  has_many :sessions
  has_many :game_review
  has_one_attached :photo
end
