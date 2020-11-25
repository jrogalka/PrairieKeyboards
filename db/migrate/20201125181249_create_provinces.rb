class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :abbreviation
      t.integer :pst
      t.integer :gst

      t.timestamps
    end
  end
end
