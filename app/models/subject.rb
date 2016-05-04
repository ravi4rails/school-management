class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :courses, :through => :course_subjects
  validates :name, :presence => true, :uniqueness => true
end
