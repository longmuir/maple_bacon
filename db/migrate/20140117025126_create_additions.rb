class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity

      t.timestamps
    end
  end
end
