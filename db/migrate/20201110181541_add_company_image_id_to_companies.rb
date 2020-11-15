class AddCompanyImageIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :company_image_id, :string
  end
end
