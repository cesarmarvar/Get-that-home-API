class RenameTypeColumnBuyerProperty < ActiveRecord::Migration[7.0]
  def change
    rename_column :buyer_properties, :type, :property_status
  end
end
