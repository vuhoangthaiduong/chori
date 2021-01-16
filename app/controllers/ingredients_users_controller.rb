class IngredientsUsersController < ApplicationController

  def show_ingredients
    @ingredients = current_user.ingredients
    @all_ingredients = Ingredient.all
    render 'users/show_ingredients'
  end

  def create
    ingredient = Ingredient.find(params[:ingredient_id])
    current_user.ingredients << ingredient
    render 'users/show_ingredients'
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    current_user.ingredients.delete(ingredient)
    render 'users/show_ingredients'
  end

end