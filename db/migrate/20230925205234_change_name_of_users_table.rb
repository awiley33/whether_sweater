class ChangeNameOfUsersTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :users_tables, :users
  end
end
