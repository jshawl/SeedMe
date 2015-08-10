class CompaniesController < ApplicationController
  before_action :get_company, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :is_user, only: [:show]
  # excellent use of callbacks here!

  def index
    @companies = Company.all.order(name: :asc)
  end

  def show
      @is_user = is_user
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
    flash[:notice] = "You've Successfully Deleted Your Company."
    @company.destroy
    redirect_to companies_path
  end

  def upvote
    @company.liked_by current_user
    redirect_to :back
  end

  private

    def company_params
        params.require(:company).permit(:name, :industry, :pitch_text, :pitch_url)
    end
    def get_company
      @company = Company.find(params[:company_id] || params[:id])
    end
    def is_user
      current_user.id == User.find(params[:user_id]).id
    end
end
