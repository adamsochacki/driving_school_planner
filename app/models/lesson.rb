class Lesson < ApplicationRecord
#  belongs_to :instructor
#  belongs_to :student
  validates :lesson_time, :student_id, :instructor_id, presence: true
end
