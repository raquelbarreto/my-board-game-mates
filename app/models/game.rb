class Game < ApplicationRecord

  # Associations
  has_many :game_sessions, dependent: :destroy
  has_many :game_review, dependent: :destroy
  has_one_attached :photo

  # Validations
  validates :name, :category,  presence: true
  validates :description, presence: true, length: { in: 20..150 }
  validates :age_rating, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :player_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
