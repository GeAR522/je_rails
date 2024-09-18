class AddUserIdToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :user_id, :integer
    add_foreign_key :posts, :users, column: :user_id
  end
end
