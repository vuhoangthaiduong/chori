class AddAmountToIngredientsUser < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients_users, :amount, :integer, default: 0
  end
end
