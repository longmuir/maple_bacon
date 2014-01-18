class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instructions
      t.string :source_url
      t.string :source_chef

      t.timestamps
    end
  end
end
