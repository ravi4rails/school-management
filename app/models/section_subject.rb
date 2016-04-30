class SectionSubject < ActiveRecord::Base
  belongs_to :section
  belongs_to :course_subject
end
