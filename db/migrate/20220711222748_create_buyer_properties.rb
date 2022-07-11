class CreateBuyerProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_properties do |t|
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
