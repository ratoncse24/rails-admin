class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :item_code, null:false
      t.string :item_name, null:false
      t.string :item_images
      t.text :item_short_description
      t.text :item_long_description
      t.integer :item_status, null:false
      t.decimal :item_price, null:false , default: 0
      t.belongs_to :category
      t.timestamps

    end
  end
end
