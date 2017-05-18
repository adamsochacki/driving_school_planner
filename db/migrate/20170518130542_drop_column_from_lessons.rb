class DropColumnFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :full_name
  end
end
