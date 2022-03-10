class AddCombinationCountToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :combinations_count, :integer
  end
end
