class AddAmountToIngredientsRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients_recipes, :amount, :integer, default: 1
  end
end
