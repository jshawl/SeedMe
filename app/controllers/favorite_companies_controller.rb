class FavoriteCompaniesController < ApplicationController
  before_action :set_company, only: [:create, :destroy]

  def create
    if Favorite.create(favorited: @company, user: current_user)
      redirect_to @company, notice: 'Company has been favorited'
    else
      redirect_to @company, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @company.id, user_id: current_user.id).first.destroy
    redirect_to @company, notice: 'Company is no longer in favorites'
  end
  def index
    @favorites = current_user.favorite_companies
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end
end
