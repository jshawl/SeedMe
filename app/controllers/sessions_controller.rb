class SessionsController < ApplicationController
    skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to companies_path, notice: "Logged in!"
    else
      flash.now[:notice] = "Username or password is invalid. Both are Case Sensitive!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end
  # it's refreshing to see such a clean solution for hand-rolled authentication.
  # Really nice job here!!
end
