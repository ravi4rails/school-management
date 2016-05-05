class EmployeeSubject < ActiveRecord::Base
  belongs_to :employee
  belongs_to :subject
  validates :subject_id, :employee_id, :department_id, :course_id, :presence => true
end
