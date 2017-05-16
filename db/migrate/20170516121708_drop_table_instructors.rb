class DropTableInstructors < ActiveRecord::Migration[5.1]
  def change
    drop_table :instructors
  end
end
