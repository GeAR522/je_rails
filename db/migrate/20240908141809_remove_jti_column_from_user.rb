class RemoveJtiColumnFromUser < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :jti
  end
end
