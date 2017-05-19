class UserMailer < ApplicationMailer

  def new_user(user)
    mail(to: user.email, subject: 'Your account at Chariot driving school has been created', template_name: 'new_user')
  end

  def deleted_user(user)
    mail(to: user.email, subject: 'Your account at Chariot driving school has been deleted', template_name: 'deleted_user')
  end

  def new_lesson(student, instructor, new_lesson_date)
    @new_lesson_date = new_lesson_date
    mail(to: [student.email, instructor.email], subject: 'New driving lesson', template_name: 'new_lesson')
  end

  def lesson_confirmed(student, instructor, confirmed_lesson_date)
    @confirmed_lesson_date = confirmed_lesson_date
    mail(to: [student.email, instructor.email], subject: 'Your driving lesson has been confirmed', template_name: 'lesson_confirmed')
  end

  def destroy_lesson(student, instructor, destroy_lesson_date)
    @destroy_lesson_date = destroy_lesson_date
    mail(to: [student.email, instructor.email], subject: 'Your driving lesson has been deleted', template_name: 'destroy_lesson')
  end



end
