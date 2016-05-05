class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :courses, :through => :course_subjects
  has_many :employee_subjects
  has_many :employees, :through => :employee_subjects
  validates :name, :presence => true, :uniqueness => true
end
