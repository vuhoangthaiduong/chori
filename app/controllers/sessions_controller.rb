class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !user
      flash[:danger] = 'Wrong email'
      puts "wrong email"
    else
      if user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to user
      else
        flash.now[:danger] = 'Wrong password'
      end
    end
  end

  def destroy

  end

end
