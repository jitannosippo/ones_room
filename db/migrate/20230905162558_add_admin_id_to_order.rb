class AddAdminIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :admin_id, :integer
  end
end
