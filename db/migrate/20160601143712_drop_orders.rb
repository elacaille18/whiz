class DropOrders < ActiveRecord::Migration
  def up
    drop_table :orders
  end

  def down
    create_table :orders do |t|
      t.string :state
      t.string :sku
      t.monetize :amount
      t.json :payment

      t.timestamps null: false
      t.monetize :amount, currency: { present: false }
    end
  end
end
