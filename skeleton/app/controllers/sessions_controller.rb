class SessionsController < ApplicationController

  def new
    redirect_to new_user_url
  end

  def create
    user = User.find_by_credentials(
    session_params[:user_name],
    session_params[:password])

    if user
      flash[:messages] = ["Welcome"]
      #login user
      redirect_to cats_url
    else
      flash.now[:messages] = ["Wrong username or password"]
      render :new
    end

  end

  def destroy

  end




end
