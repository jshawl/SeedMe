class FavoriteCompaniesController < ApplicationController
  before_action :current_user
  before_action :set_company

  def create
    if Favorite.create(favorited: @company, user: @current_user)
      redirect_to user_company_path(@company.user, @company), notice: "Company has been favorited"
    else
      redirect_to @company, alert: "Something went wrong! Company not favorited."
    end
  end

  def destroy
    Favorite.where(favorited_id: @company.id, user_id: @current_user.id).first.destroy
    redirect_to @company, notice: "Company removed from favorites"
  end
  private
  def current_user
    @current_user = User.find(session[:user]["id"])
  end
  def set_company
    @company = Company.find(params[:company_id] || params[:id])
  end
end
