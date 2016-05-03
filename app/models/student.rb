class Student < ActiveRecord::Base
  belongs_to :batch
  belongs_to :course
  has_many :guardians

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
