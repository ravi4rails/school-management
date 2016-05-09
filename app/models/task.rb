class Task < ActiveRecord::Base
  has_many :employee_tasks
  has_many :employees, :through => :employee_tasks 
  validates :title, :description, :due_date, :presence => true

  before_create :set_default_status

  def set_default_status
    self.status = "Pending"
  end

end
