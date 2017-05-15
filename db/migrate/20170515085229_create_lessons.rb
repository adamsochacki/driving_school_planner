class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.integer :instructor_id
      t.integer :student_id
      t.datetime :lesson_time

      t.timestamps
    end
  end
end
