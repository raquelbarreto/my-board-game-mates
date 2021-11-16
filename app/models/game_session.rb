class GameSession < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_one_attached :photo
  has_many :lobbies, dependent: :destroy
  has_many :users, through: :lobbies, dependent: :destroy
end
