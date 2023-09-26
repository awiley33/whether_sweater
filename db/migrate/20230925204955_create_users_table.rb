class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users_tables do |t|
      t.string "email"
      t.string "password"
      t.timestamps
    end
  end
end
