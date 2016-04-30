class Course < ActiveRecord::Base
  belongs_to :department
  has_many :sections
  has_many :course_subjects
  has_many :subjects, :through => :course_subjects
end
