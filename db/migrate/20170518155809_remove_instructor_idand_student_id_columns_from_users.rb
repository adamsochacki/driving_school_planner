class RemoveInstructorIdandStudentIdColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:users, :instructor_id)
    remove_column(:users, :student_id)
  end
end
