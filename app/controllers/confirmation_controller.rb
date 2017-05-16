class ConfirmationController < ApplicationController

  def send_email
    if Lesson.paramas[:confirmed] == true
      send_confirmation_email_to_student
    else
      send_denying_email_to_student
    end
  end 

  private
  
  def send_confirmation_email_to_student
    AppMailer.confirmation_email(self.email).deliver
  end

  def send_denying_email_to_student
    AppMailer.denying_email(self.email).deliver
  end

end
