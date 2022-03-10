class AddCategoryReferenceToDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dishes, :categories
    add_index :dishes, :category_id
    change_column_null :dishes, :category_id, false
  end
end
