class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :selling_price, null: false
      t.integer :order_id, foreign_key: true
      t.timestamps
    end
  end
end
