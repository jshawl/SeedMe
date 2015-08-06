class UsersController < ApplicationController
  skip_before_action :current_user
  skip_before_action :authorize


  def show
      @user = User.find(params[:id])
    if @user.companies.empty?
      message = "Please add your company information to continue. Failure to input company information could result in performance issues!"
      redirect_to new_user_company_path(@user, Company.new)
      flash[:notice] = message
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      message = "Your Account Has Been Created."
      flash[:notice] = message
      redirect_to '/login'
    else
      render "new"
    end
  end


    private
      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
      end
end
