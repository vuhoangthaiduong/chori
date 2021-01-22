class AddAuthorToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :author_id, :integer
    add_index :recipes, :author
    add_foreign_key :recipes, :users, column: :author_id
  end
end
