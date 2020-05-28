class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.string :brand
      t.integer :status, null:false
      t.integer :send_fee, null:false
      t.integer :region_id, null:false
      t.integer :send_day, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end
