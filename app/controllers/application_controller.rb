class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_session

  MAX_SESSION_TIME = 10
  # Make sure the session has not expired
  # Update the expire date of the session
  def prepare_session
    if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
      reset_session
    end

    session[:expiry_time] = MAX_SESSION_TIME.minutes.from_now
    return true
  end
    
  def authenticate
    if User.exists? session[:user_id]
      @current_user = User.find session[:user_id]
    else
      redirect_to log_in_path and return false
    end
  end
end
