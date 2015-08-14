class UserController < ApplicationController
  def new
    # render a view to singup
  end

  def create
    # create some user and such
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @message = 'Passwords did not match.'
      render 'user/new'
      #render loads an erb view via path it looks for them inside app/views
    end

  end

private
# everythig after private... is private
# only owned by this controller

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
