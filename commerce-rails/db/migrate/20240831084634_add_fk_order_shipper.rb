class AddFkOrderShipper < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :shippings, foreign_key: true
    remove_column :shippings, :order_id, :integer
  end
end
