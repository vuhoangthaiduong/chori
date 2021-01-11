class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :info
      t.string :group

      t.timestamps
    end
  end
end
