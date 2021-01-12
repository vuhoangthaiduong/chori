class Ingredient < ApplicationRecord
  has_many :users
  has_many :recipes
  validates :name, presence: true,
                   length: { maximum: 255 },
                   uniqueness: true
  validates :group, presence: true,
                    length: { maximum: 255 }
  validates :info, length: { maximum: 255 }
end
