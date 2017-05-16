class AddColumnToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :student_type, :text
  end
end
