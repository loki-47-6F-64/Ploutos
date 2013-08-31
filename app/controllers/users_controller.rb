class UsersController < ApplicationController
  def create
    @user = User.new user_params
    
    if @user.save
      redirect_to log_in_path
    else
      render 'sign_up'
    end
  end

  def sign_up
    @user = User.new
  end

  #direct to login page
  def log_in
  end

  # Actual log-in
  def activate
    credentials = params[:user].permit(:username, :password)
    @user = User.find_by username: credentials[:username]

    if( @user && @user.authenticate(credentials[:password]) )
      reset_session

      session[:user_id] = @user.id 
      redirect_to overviews_index_path
    else
      redirect_to log_in_path
    end
  end

  # Log-out
  def deactivate
    session[:user_id] = nil

    redirect_to log_in_path
  end

  def user_params
    params[:user].permit(:username, :password, :password_confirmation)
  end
end
