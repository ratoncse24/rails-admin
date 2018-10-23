class CreateAdminOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_orders do |t|
      t.string :order_number
      t.string :order_status
      t.decimal :order_pricetotal
      t.string :order_payment_type
      t.string :order_giftcard
      t.belongs_to :customers

      t.timestamps
    end
  end
end
