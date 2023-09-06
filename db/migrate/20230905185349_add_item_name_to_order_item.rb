class AddItemNameToOrderItem < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :item_name, :string
  end
end
