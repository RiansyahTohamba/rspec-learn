class AddCityToShippings < ActiveRecord::Migration[7.1]
  def change
    add_column :shippings, :city, :string
  end
end
