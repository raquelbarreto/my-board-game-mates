class GameSession < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_one_attached :photo
  has_many :lobbies, dependent: :destroy
  has_many :users, through: :lobbies, dependent: :destroy

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
