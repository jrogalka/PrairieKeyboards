class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.string :order_address
      t.string :order_email
      t.integer :pst
      t.integer :gst
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
