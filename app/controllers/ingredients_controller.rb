class IngredientsController < ApplicationController

  def index
    @all_ingredients = Ingredient.all
    @my_ingredients = current_user.ingredients
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render 'index'
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :info, :group)
  end

end
