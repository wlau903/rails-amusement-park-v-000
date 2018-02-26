class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    if user && authenticated
      @user = user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end