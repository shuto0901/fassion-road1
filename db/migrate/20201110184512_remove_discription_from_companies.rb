class RemoveDiscriptionFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :discription, :string
  end
end
