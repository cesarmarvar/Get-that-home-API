class AddColumnsLatAndLongToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :lat, :float
    add_column :properties, :long, :float
  end
end
