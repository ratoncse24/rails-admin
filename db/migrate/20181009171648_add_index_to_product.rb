class AddIndexToProduct < ActiveRecord::Migration[5.2]
  def change
    add_index :products, :item_code
  end
end
