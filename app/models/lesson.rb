class Lesson < ApplicationRecord
  belongs_to :instructor, class_name: "User"
  belongs_to :student, class_name: "User"
  validates :lesson_time, presence: true, uniqueness: true
  validates :student_id, presence: true
  validates :instructor_id, presence: true
  after_create :send_new_lesson_email
  after_update :send_lesson_confirmed_email
  after_destroy :send_destroy_lesson_email

  private

  def users_getter
    @student = student
    @instructor = instructor
  end

  def send_new_lesson_email
    users_getter
    @new_lesson_date = lesson_time
    UserMailer.new_lesson(@student, @instructor, @new_lesson_date).deliver
  end

  def send_lesson_confirmed_email
    users_getter
    @confirmed_lesson_date = lesson_time
    UserMailer.lesson_confirmed(@student, @instructor, @confirmed_lesson_date).deliver
  end

  def send_destroy_lesson_email
    users_getter
    @destroy_lesson_date = lesson_time
    UserMailer.destroy_lesson(@student, @instructor, @destroy_lesson_date).deliver 
  end

end
