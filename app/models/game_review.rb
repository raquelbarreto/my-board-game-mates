class GameReview < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :game

  # Validations
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :content, presence: true, length: { minimum: 50 }
end
