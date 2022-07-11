class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.float :price, precision: 10, scale: 2
      t.float :maintenance, precision: 10, scale: 2
      t.integer :property_type
      t.boolean :pets
      t.text :about
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :area
      t.integer :operation_type
      t.references :user, null: false, foreign_key: true
      t.boolean :is_active, default: true

      t.timestamps
    end
    add_index :properties, :address, unique: true
  end
end
