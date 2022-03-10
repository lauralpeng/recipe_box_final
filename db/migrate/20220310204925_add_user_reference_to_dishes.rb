class AddUserReferenceToDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dishes, :users
    add_index :dishes, :user_id
    change_column_null :dishes, :user_id, false
  end
end
