class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    #you find the current user IF the session exists
    @current_user ||= User.find(session[:user_id]) if session[:user_id]


  end

  #the helper is only for view use
  helper_method :current_user




  def authorize

    redirect_to '/user/login' unless current_user
    end
  end


#this protects someone from trying to minipulate or mess up your code. forgery or cross site.
