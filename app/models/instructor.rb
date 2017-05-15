class Instructor < ApplicationRecord
  has_many :students
  has_many :lessons, through: :students
end
