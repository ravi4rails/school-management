class Student < ActiveRecord::Base
  belongs_to :batch
  belongs_to :course
  has_many :guardians
  validates :first_name, :middle_name, :last_name, :email, :admission_date, :admission_number, :enrollment_number, :enrollment_date, :date_of_birth, :age, :presence => true
  validates :email, :uniqueness => true
  validates :age, :numericality => true

  geocoded_by :full_address
  after_validation :geocode

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def full_address
    "#{city} #{state} #{country}"
  end

end
