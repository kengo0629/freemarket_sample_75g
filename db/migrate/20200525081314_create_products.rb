class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,           null: false
      t.integer    :price,          null: false
      t.text       :description,    null: false
      t.string     :condition,      null: false
      t.integer    :brand,          null: false
      t.integer    :delivery_price, null: false
      t.integer    :user_id,        null:false,foreign_key:true
      t.integer    :category_id,    null:false,foreign_key:true
      t.timestamps
    end
  end
end
