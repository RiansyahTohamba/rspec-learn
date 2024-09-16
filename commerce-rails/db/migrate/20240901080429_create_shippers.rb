class CreateShippers < ActiveRecord::Migration[7.1]
  def change
    create_table :shippers do |t|
      t.string :name
      t.string :contact
      t.string :api_credentials

      t.timestamps
    end
  end
end
