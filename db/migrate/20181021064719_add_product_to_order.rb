class AddProductToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders , :product
  end
end
