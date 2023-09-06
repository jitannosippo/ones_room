class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer "payment_method"
      t.integer "customer_id"
      t.string "address"
      t.integer "postage"
      t.integer "total_price"
      t.string "name"

      t.timestamps
    end
  end
end
