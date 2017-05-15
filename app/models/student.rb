class Student < ApplicationRecord
  has_many :lessons
  belongs_to :instructor
end
