class AddFkOrderShipperP2 < ActiveRecord::Migration[7.1]
  def change
    add_reference :shippings, :orders, foreign_key: true
    remove_foreign_key :orders, :shippings if foreign_key_exists?(:orders, :shippings)
    remove_column :orders, :shipping_id
    remove_column :shippings, :carrier, :string
  end
end
