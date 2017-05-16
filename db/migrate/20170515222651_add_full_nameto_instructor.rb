class AddFullNametoInstructor < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :full_name, :string
  end
end
