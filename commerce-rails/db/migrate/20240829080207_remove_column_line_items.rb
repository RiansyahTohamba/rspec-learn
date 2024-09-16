class RemoveColumnLineItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :line_items, :item, :integer
    remove_column :line_items, :cart, :integer
    remove_column :line_items, :order, :integer
  end
end
