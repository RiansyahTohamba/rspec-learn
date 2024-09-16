class CreateShippings < ActiveRecord::Migration[7.1]
  def change
    create_table :shippings do |t|
      t.string :tracking_number
      t.string :carrier
      t.string :status
      t.datetime :shipped_at
      t.datetime :delivered_at
      t.decimal :cost
      t.integer :order_id

      t.timestamps
    end
  end
end
