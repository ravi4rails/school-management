class Student < ActiveRecord::Base
  belongs_to :batch


  def self.active_students
    Batch.where(:is_active => true).joins(:students)
  end

  def self.inactive_students
    Batch.where(:is_active => false).joins(:students)
  end
end
