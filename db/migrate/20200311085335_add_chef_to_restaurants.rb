class AddChefToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :chef, :string
    # add_column :table_name, :column_name, :datatype
  end
end
