class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true
      t.integer :gift_type
      t.integer :quantity

      t.timestamps
    end
  end
end
