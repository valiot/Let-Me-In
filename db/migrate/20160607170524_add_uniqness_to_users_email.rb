class AddUniqnessToUsersEmail < ActiveRecord::Migration[5.0]
  def down
    change_column :users, :email, :string
  end

  def up
    add_index :users, :email, unique: true
  end
end
