class CompanyController < ApplicationController
  
  def show
    @company = Company.find(params[:id])
    @favorites = Favorite.where(company_id: @company.id)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to company_path(@company)
  end
  
  private
  def company_params
    params.require(:company).permit(:company_name, :description, :company_image)
  end
end
