class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Authentications
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :user_reviews, foreign_key: :recepient_id, dependent: :destroy
  has_many :game_reviews, dependent: :destroy
  has_many :lobbies, dependent: :destroy
  has_many :game_sessions, dependent: :destroy
  has_one_attached :photo

  # Validations
  validates :first_name, :last_name, presence: true
  # validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validates :gender, inclusion: { in: %w[m f other] }

end
