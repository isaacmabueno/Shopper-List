class SessionsController < ApplicationController
  def new
    #show a login form!

  end

  def create
    #this is going to be the POST request to validate/create a session
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      #if it works "Hey, we got logged in. YAYYYY!!!!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @message = "Username or password is incorrect."
      render '/sessions/new'
    end
  end

  def delete
    #delete/destroy the session
    session[:user_id] = nil
    redirect_to '/user/login'
  end
end
