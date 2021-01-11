class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :difficulty
      t.string :instruction
      t.string :info

      t.timestamps
    end
  end
end
