class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :instructorlessons, class_name: "Lesson",
                          foreign_key: "instructor_id"
  has_many :lessons, as: :student
end
