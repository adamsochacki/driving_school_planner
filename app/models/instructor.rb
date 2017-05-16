class Instructor < ApplicationRecord
  has_many :students
  has_many :lessons, through: :students
  has_one :user
  validates :name, :surname, presence: true
end
