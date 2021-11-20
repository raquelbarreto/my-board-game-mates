class UserReview < ApplicationRecord

  # Associations
  belongs_to :recepient, class_name: 'User'
  belongs_to :author, class_name: 'User'

  # Validations
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :content, presence: true, length: { in: 10..50 }
end
