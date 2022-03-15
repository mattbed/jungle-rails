class SessionsController < ApplicationController

  def new
  end

  def create
    # If the user exists and the password entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If users login doesn't work, redirect back
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end