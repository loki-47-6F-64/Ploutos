class UsersController < ApplicationController
before_action :authenticate, only: [:update_savings, :update_password, :edit_password]
  def create
    @user = User.new user_params
    @user.savings = BigDecimal.new '0'    

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

  def edit_password
  end

  def update_password
    credentials = params[:user].permit(:password, :password_confirmation)
    old_password = params[:user].permit(:old_password)[:old_password]

    if @current_user.authenticate( old_password ) &&
      credentials[:password] == credentials[:password_confirmation] &&
        @current_user.update(credentials)

        redirect_to root_path
    else
        render 'edit_password'
    end
  end

  def update_savings 
    if @current_user.update params[:user].permit(:savings)
      redirect_to root_path
    else
      render 'overviews/index'
    end
  end

  def user_params
    params[:user].permit(:username, :password, :password_confirmation)
  end
end
