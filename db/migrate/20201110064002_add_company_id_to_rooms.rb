class AddCompanyIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :company_id, :integer
  end
end
