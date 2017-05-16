class AppMailer < ApplicationMailer

  def confirmation_request(instructor_email)
    @greeting = "Witaj! Masz prośbę o kurs dnia (data), (godzina)"
    mail to: instructor_email
  end

end