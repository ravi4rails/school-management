class Task < ActiveRecord::Base
  validates :title, :description, :due_date, :presence => true

  before_create :set_default_status

  def set_default_status
    self.status = "Pending"
  end

end
