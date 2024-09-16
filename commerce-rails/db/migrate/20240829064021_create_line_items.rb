class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.integer :item
      t.integer :cart
      t.integer :order
      t.integer :quantity

      t.timestamps
    end
  end
end
