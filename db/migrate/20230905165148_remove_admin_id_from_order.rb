class RemoveAdminIdFromOrder < ActiveRecord::Migration[6.1]
  def up
    remove_column :orders, :admin_id, :integer
  end

  def down
    add_column :orders, :admin_id, :integer
  end
end
