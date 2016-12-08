class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:messages] = ["Welcome #{@user.username}- choose a cat!"]
      redirect_to cats_url
    else
      flash.now[:messages] = ["Invalid credentials(username/password)"]
      render :new
    end
  end



  def user_params
    params.require(:user).permit(:username, :password)
  end

end
