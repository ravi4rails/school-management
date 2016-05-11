class Employee < ActiveRecord::Base
  belongs_to :department
  has_many :employee_subjects
  has_many :subjects, :through => :employee_subjects
  has_many :employee_tasks
  has_many :tasks, :through => :employee_tasks
  validates :first_name, :middle_name, :last_name, :age, :email, :date_of_joining, :date_of_birth, :qualification, :presence => true
  validates :email, :uniqueness => true
  validates :age, :numericality => true

  geocoded_by :full_address
  after_validation :geocode

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def full_address
    "#{city} #{state} #{country}"
  end

end

# <!-- AIzaSyDSn87BAlXf3_IKKAXZzb8h2sRLLwMPQhA  -->
