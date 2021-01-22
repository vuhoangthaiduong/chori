class User < ApplicationRecord
  extend FriendlyId
  friendly_id :user_name, use: %i[slugged finders]

  attr_accessor :slug

  has_many :ingredients_users, class_name: "IngredientsUser",
                               foreign_key: "user_id", dependent: :destroy
  has_many :ingredients, through: :ingredients_users

  has_many :recipes, dependent: :destroy, foreign_key: "author_id"

  attribute :admin, :boolean, default: 'false'

  before_save { email.downcase! }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_USER_NAME_REGEX = /\A[a-z]+\z/i.freeze
  validates :user_name, presence: true, length: { maximum: 50 },
                        format: { with: VALID_USER_NAME_REGEX },
                        uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
