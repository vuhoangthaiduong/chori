class IngredientsRecipe < ApplicationRecord
  belongs_to :ingredient, class_name: "Ingredient"
  belongs_to :recipe, class_name: "Recipe"
end
