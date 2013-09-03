class UsersController < ApplicationController
before_action :authenticate, only: [:update_data, :edit_data, :update_password, :edit_password]
  def create
    @user = User.new user_params
    @user.savings = BigDecimal.new '0'    

    if @user.save
      notify :success, 'User created successfully.', true

      redirect_to log_in_path
    else
      notify :error, @user.errors.full_messages

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

      notify :info, 'Welcome.', true

      session[:user_id] = @user.id 
      redirect_to overviews_index_path
    else
      notify :error, ['Username and/or Password is incorrect'], true

      redirect_to log_in_path
    end
  end

  # Log-out
  def deactivate
    session[:user_id] = nil

    notify :info, 'You are logged out.', true

    redirect_to log_in_path
  end

  def edit_password
  end

  def update_password
    credentials = params[:user].permit(:password, :password_confirmation)
    old_password = params[:user].permit(:old_password)[:old_password]

    if !@current_user.authenticate( old_password )
      notify :error, ['Incorrect password']

      render 'edit_password'
      return
    end

    @current_user.password = credentials[:password]
    @current_user.password_confirmation = credentials[:password_confirmation]

    if @current_user.valid? :update_password
      @current_user.update credentials

      notify :success, 'Password updated successfully', true

      redirect_to root_path
    else
      notify :error, @current_user.errors.full_messages

      render 'edit_password'
    end
  end

  def edit_data
  end

  def update_data 
    if @current_user.update params[:user].permit(:savings)
      notify :success, 'Successfully changed your data', true

      redirect_to root_path
    else
      notify :error, @current_user.errors.full_messages

      render 'edit_data'
    end
  end

  def user_params
    params[:user].permit(:username, :password, :password_confirmation)
  end
end
