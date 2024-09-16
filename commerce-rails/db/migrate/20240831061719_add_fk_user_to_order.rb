class AddFkUserToOrder < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :user_id, :integer
    add_reference :orders, :user, foreign_key: true
  end
end
