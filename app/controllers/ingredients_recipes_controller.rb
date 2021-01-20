class IngredientsRecipesController < ApplicationController

  def create
    ingredient = Ingredient.find_by(id: params[:ingredient_id])
    recipe = Recipe.find_by(id: params[:recipe_id])
    recipe.ingredients << ingredient
  end

  def update
    # ingredients_recipes = IngredientsRecipe.find_by(ingredient_id: ingredients_recipes_params[:ingredient_id],
    #                                                 recipes_id: ingredients_recipes_params[:recipe_id])
  end

  def destroy
    ingredients_recipes = IngredientsRecipe.find_by(ingredient_id: ingredients_recipes_params[:ingredient_id],
                                                     recipes_id: ingredients_recipes_params[:recipe_id])
    ingredients_recipes.destroy
  end

  def ingredients_recipes_params
    params.require(:ingredients_recipes)
  end
end
