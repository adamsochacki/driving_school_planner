class AddFlagColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_an_instructor, :boolean
    add_column :users, :is_a_manager,:boolean
  end
end
