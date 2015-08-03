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
