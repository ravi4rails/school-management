class Task < ActiveRecord::Base
  validates :title, :description, :due_date, :presence => true
end
