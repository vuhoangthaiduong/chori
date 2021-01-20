class ChangeAmountDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :ingredients_users, :amount, :integer, default: 1
  end
end
