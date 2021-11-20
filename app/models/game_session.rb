class GameSession < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :game
  has_one_attached :photo
  has_many :lobbies, dependent: :destroy
  has_many :users, through: :lobbies, dependent: :destroy

  # Validations
  validates :date, :time, :address, :is_smoke_free, :is_family_friendly,
            :has_drinks, :has_food, :capacity, :is_recurrent_boolean, :session_name, presence: true

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
