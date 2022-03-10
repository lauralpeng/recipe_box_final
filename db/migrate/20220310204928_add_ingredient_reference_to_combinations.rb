class AddIngredientReferenceToCombinations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :combinations, :ingredients
    add_index :combinations, :ingredient_id
    change_column_null :combinations, :ingredient_id, false
  end
end
