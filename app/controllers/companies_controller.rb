class CompaniesController < ApplicationController
  before_action :get_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
  end

  private
    def company_params
        params.require(:company).permit(:name, :industry, :pitch_text, :pitch_url)
    end
    def get_company
      @company = Company.find(params[:id])
    end
end
