class UserReview < ApplicationRecord
  belongs_to :recepient, class_name: 'User'
  belongs_to :author, class_name: 'User'
end
