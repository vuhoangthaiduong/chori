class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(id: @user.user_name)
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

  def ingredients
    @ingredients = current_user.ingredients
  end

  def recipes
    @recipes = current_user.recipes
  end

  def has_in_fridge? ingredient
    ingredients.include?(ingredient)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name,
                                 :password, :password_confirmation, :email)
  end

end
