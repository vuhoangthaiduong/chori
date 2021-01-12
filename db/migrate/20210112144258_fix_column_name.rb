class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :remember_token, :remember_digest
  end
end
