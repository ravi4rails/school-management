class EmployeeTask < ActiveRecord::Base
  belongs_to :employee
  belongs_to :task
end
