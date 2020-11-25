class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :billing_address
      t.string :shipping_address
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
