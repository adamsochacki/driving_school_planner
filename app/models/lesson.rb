class Lesson < ApplicationRecord
  belongs_to :instructor, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :lesson_time, presence: true
end
