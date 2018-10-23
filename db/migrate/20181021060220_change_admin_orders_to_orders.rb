class ChangeAdminOrdersToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :admin_orders, :orders
  end
end
