class IngredientsUsersController < ApplicationController

  def show_ingredients
    @ingredients = current_user.ingredients
    @all_ingredients = Ingredient.all
    render 'users/show_ingredients'
  end

  def create
    ingredient = Ingredient.find(params[:ingredient_id])
    if current_user.ingredients.include? ingredient
      record = IngredientsUser.find_by(ingredient_id: ingredient.id, user_id: current_user.id)
      record.update(amount: record.amount + 1)
    else
      current_user.ingredients << ingredient
    end
    redirect_to user_show_ingredients_user_path(current_user.id)
  end

  def destroy
    ingredient = IngredientsUser.find(params[:id]).ingredient
    current_user.ingredients.delete(ingredient)
    redirect_to user_show_ingredients_user_path(current_user.id)
  end

end