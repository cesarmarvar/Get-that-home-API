class RenameColumnTypeFromUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :type, :user_type
  end
end
