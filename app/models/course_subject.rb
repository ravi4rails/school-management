class CourseSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :course
  has_many :section_subjects, :dependent => :destroy
end
