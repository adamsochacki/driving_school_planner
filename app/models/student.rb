class Student < ApplicationRecord
#  has_many :lessons
#  belongs_to :instructor
  validates :name, presence: true
  validates :surname, presence: true


end
