class FavoriteCompaniesController < ApplicationController
  before_action :set_company, only: [:create, :destroy]

  def create
    if Favorite.create(favorited: @company, user: current_user)
      flash[:notice] = 'Company has been favorited'
      redirect_to :back
    else
      redirect_to :back, alert: 'Something went wrong'
    end
  end

  def destroy
    Favorite.where(favorited_id: @company.id, user_id: current_user.id).first.destroy
    redirect_to  :back, notice: 'Company is no longer in favorites'
  end

  def index
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end
end
