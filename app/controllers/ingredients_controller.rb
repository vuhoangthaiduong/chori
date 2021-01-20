class IngredientsController < ApplicationController

  def index
    @all_ingredients = Ingredient.ordered_by_name.all
    @my_ingredients = current_user.ingredients
  end

  def show
    @ingredient = Ingredient.find(params[:id])
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
