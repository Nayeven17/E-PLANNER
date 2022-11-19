class RenameColumnIsBuyer < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :is_buyer?, :is_buyer
  end
end
