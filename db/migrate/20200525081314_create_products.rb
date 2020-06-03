class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,           null: false
      t.text       :description,    null: false
      t.string     :brand,          null: false
      t.integer    :status,         null: false
      t.integer    :send_fee,       null: false
      t.string     :region_id,      null: false
      t.integer    :send_day,       null: false
      t.integer    :price,          null: false
      t.integer    :buy_user_id,    null: false,foreign_key:true
      t.integer    :category_id,    null: false,foreign_key:true
      t.timestamps
    end
  end
end
