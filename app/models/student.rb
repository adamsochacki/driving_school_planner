class Student < ApplicationRecord
  has_many :lessons
  belongs_to :instructor
  has_one :user
#  after_create :increment_counter, :send_confirmation_request_to_instructor
#  after_destroy :decerement_counter
  validates :name, presence: true
  validates :surname, presence: true


#  def app_count
#    app_counter.hours_driven
#  end

#  def app_counter
#    Hours_driven.find_by(model: self.class.to_s)
#  end

#  def increment_counter
#    if app_counter
#      app_counter.update(hours_driven: app_count + 1)
#    else
#      Hours_driven.create(model: self.class.to_s, hours_driven: 1)
#    end
#  end

#  def decerement_counter
#    app_counter.update(hours_driven: app_count - 1)
#  end

#  def send_confirmation_request_to_instructor
#    AppMailer.confirmation_request(self.email).deliver
#  end 

end
