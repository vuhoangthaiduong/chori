class AddIdToIngredientRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients_recipes, :id, :primary_key
  end
end
