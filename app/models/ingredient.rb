class Ingredient < ApplicationRecord
  has_many :ingredients_users, class_name: "IngredientsUser",
           foreign_key: "ingredient_id", dependent: :destroy
  has_many :users, through: :ingredients_users

  has_many :ingredients_recipes, dependent: :destroy
  has_many :recipes, through: :ingredients_recipes

  validates :name, presence: true,
                   length: { maximum: 255 },
                   uniqueness: true
  validates :group, presence: true,
                    length: { maximum: 255 }
  validates :info, length: { maximum: 255 }

  scope :ordered_by_name, -> { order(name: :asc) }


end
