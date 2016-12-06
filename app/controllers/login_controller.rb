class LoginController < ApplicationController
  def index
  end

  def authenticate
    @user = User.find_by username: params[:username], password: params[:password]

    # create flash messages and redirect based on login success
    if @user
      flash[:message] = "You have been logged in."

      # set user id as session param, accessible to entire app
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:message] = "You have not been logged in. User cannot be found."
      redirect_to login_path
    end
  end

  # delete session key to logout (set to nil)
  def logout
    session[:user_id] = nil
    flash[:message] = "You have been logged out."
    redirect_to login_path
  end

end
