class Course < ActiveRecord::Base
  belongs_to :department
  has_many :batches
  has_many :students
  has_many :sections
  has_many :course_subjects
  has_many :subjects, :through => :course_subjects
  validates :name, :duration, :department_id, :presence => true
end
