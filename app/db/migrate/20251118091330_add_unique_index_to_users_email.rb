class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[8.0]
  def up
    User.where(email: nil).update_all(email: "")

    add_index :users, :email, unique: true
    change_column_null :users, :email, false
  end

  def down
    remove_index :users, :email
    change_column_null :users, :email, true
  end
end
