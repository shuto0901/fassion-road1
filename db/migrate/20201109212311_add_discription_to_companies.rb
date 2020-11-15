class AddDiscriptionToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :discription, :string
  end
end
