class UsersController < ApplicationController
  skip_before_action :authenticate
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_up
    @user = User.new
  end

  def sign_up!
      @user = User.new(
        username: params[:username],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email]
      )
      if @user.save
        message = "Your account has been created!"
        redirect_to root_url
        flash[:notice] = message
      else
        message = "Your account couldn't be created. Did you enter a unique username and password?"
        flash.now[:notice] =  message
        render :sign_up
      end
  end

  def sign_in
  end

  def sign_in!
      @user = User.find_by(username: params[:username])
      if !@user
        message = "User Doesn't Exist!"
      elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
        message = "Incorrect Password!"
      else
        message = "You're signed in, #{@user.username}!"
        cookies[:username] = {
         value: @user.username,
         expires: 10.days.from_now
        }
        session[:user] = @user
      end
      flash[:notice] = message
      redirect_to root_url
    end

    def sign_out
      flash[:notice] = "You're signed out!"
      reset_session
      redirect_to root_url
    end
end
