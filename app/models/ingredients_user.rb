class IngredientsUser < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :ingredient, class_name: "Ingredient"
end