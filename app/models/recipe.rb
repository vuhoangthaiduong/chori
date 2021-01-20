class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :ingredients_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredients_recipes
end
