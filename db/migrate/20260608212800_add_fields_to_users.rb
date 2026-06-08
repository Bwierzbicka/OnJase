class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :username, :string
    add_column :users, :displayed_name, :string
  end
end
