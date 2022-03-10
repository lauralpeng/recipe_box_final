class AddDishCountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :dishes_count, :integer
  end
end
