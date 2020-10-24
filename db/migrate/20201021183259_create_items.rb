class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :introduction,        null: false
      t.integer :price,            null: false
      t.integer :condition,        null: false
      t.integer :size_id,          null: false
      t.references :category,      null: false, foreign_key: true
      t.string :brand
      t.integer :prefecture_id,    null: false
      t.integer :shipping_cost_id, null: false
      t.integer :shipping_days_id, null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end