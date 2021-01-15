class Ingredient < ApplicationRecord
  has_many :ingredients_users, class_name: "IngredientsUsers",
           foreign_key: "ingredient_id"
  has_many :users, through: :ingredients_users
  has_many :recipes
  validates :name, presence: true,
                   length: { maximum: 255 },
                   uniqueness: true
  validates :group, presence: true,
                    length: { maximum: 255 }
  validates :info, length: { maximum: 255 }
end
