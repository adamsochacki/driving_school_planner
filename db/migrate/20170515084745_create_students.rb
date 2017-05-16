class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.integer :hours_driven
      t.string :email
      t.integer :instructor_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
