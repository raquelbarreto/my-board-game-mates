class Lobby < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :game_session

  # Validations
  validates :available, inclusion: [true, false]
end
