class AddColumnFullNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :text
  end
end