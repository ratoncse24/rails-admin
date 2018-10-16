class RemoveColumnsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :item_images
  end
end
