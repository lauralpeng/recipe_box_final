class CreateCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :combinations do |t|
      t.integer :ingredient_id
      t.float :quantity
      t.string :unit
      t.integer :dish_id

      t.timestamps
    end
  end
end
