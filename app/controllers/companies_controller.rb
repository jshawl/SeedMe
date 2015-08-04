class CompaniesController < ApplicationController
  before_action :get_user, only: [:show, :edit, :new, :create, :update, :destroy]
  before_action :get_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all.order(name: :asc)
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create!(company_params.merge(user:@user))
    if @company.save
      redirect_to user_company_path(@company.user, @company)
    else
      render new_user_company(@user)
    end
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      redirect_to user_company_path(@company.user, @company)
    else
      render edit_user_company_path(@user, @company)
    end
  end

  def destroy
    if session[:user]["id"] != @user.id
      message = "You Can't Delete Other Companies!"
      flash.now[:notice] = message
      render :show
    else
      message = "You've Successfully Deleted Your Company."
      @company.destroy
      redirect_to root_url
      flash[:notice] = message
    end
  end

  private
    def company_params
        params.require(:company).permit(:name, :industry, :pitch_text, :pitch_url)
    end
    def get_user
      @user = User.find(params[:user_id])
    end
    def get_company
      @company = Company.find(params[:id])
    end
end
