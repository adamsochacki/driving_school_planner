class AddEmailToInstructor < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :email, :string
  end
end
