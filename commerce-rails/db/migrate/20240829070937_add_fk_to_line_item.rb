class AddFkToLineItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :line_items, :item, null: false, foreign_key: true
    add_reference :line_items, :cart, null: false, foreign_key: true
    add_reference :line_items, :order, foreign_key: true 
  end
end
