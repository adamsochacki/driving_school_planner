class CreateInstructors < ActiveRecord::Migration[5.1]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.integer :student_id

      t.timestamps
    end
  end
end
