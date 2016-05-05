class Employee < ActiveRecord::Base
  belongs_to :department
  has_many :employee_subjects
  has_many :subjects, :through => :employee_subjects
  validates :first_name, :middle_name, :last_name, :age, :email, :date_of_joining, :date_of_birth, :qualification, :presence => true
  validates :email, :uniqueness => true
  validates :age, :numericality => true

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
