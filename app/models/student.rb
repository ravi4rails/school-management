class Student < ActiveRecord::Base
  belongs_to :batch
  belongs_to :course

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
