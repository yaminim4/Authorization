class SessionController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    sessions_params[:username],
    sessions_params[:password])

    if @user
      login(@user)
      flash[:messages] = ["Welcome back! #{@user.username}"]
      redirect_to cats_url
    else
      flash.now[:messages] = ["Wrong username/password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end


private

  def sessions_params
    params.permit(:username, :password)
  end

end
