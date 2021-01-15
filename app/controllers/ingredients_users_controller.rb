class IngredientsUsersController < ApplicationController

    def create
        ingredient = Ingredient.find(params[:ingredient_id])
        current_user.ingredients << ingredient
    end

    def destroy
        ingredient = Ingredient.find(params[:id]).followed
        current_user.ingredients.delete(ingredient)
    end

end