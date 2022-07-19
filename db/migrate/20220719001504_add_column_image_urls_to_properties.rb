class AddColumnImageUrlsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :image_urls, :string
  end
end
