class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :school, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true
      t.integer :status
      t.date :date
      t.integer :gift_type
      t.boolean :notify_user

      t.timestamps
    end
  end
end
