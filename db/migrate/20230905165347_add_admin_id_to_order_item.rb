class AddAdminIdToOrderItem < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :admin_id, :integer
  end
end
