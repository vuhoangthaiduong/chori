class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !user
      flash.now[:danger] = 'Wrong email'
      render 'new'
      puts "wrong email"
    elsif user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Wrong password'
      puts "wrong password"
      render 'new'
    end
  end

  def destroy
    if logged_in?
      log_out
      redirect_to root_path
    end
  end

end
