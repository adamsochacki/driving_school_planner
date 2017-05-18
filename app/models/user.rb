class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :instructorlessons, class_name: "Lesson",
                          foreign_key: "instructor_id"
 # has_many :lessons, as: :students      
  has_many :studentlessons, class_name: "Lesson",
                         foreign_key: "student_id"
end


