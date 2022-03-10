class AddDishReferenceToCombinations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :combinations, :dishes
    add_index :combinations, :dish_id
    change_column_null :combinations, :dish_id, false
  end
end
