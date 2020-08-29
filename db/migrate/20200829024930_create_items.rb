class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.text :detail
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_charge_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :selling_price
      t.timestamps
    end
  end
end
