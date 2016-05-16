class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :batch
  belongs_to :course
  belongs_to :section
  has_many :guardians
  validates :first_name, :middle_name, :last_name, :email, :admission_date, :admission_number, :enrollment_number, :enrollment_date, :date_of_birth, :age, :presence => true
  validates :email, :uniqueness => true
  validates :age, :numericality => true
  mount_uploader :profile_picture, ImageUploader
  geocoded_by :full_address
  after_validation :geocode
  after_create :add_count_to_section

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def full_address
    "#{city} #{state} #{country}"
  end

  def add_count_to_section
    self.section.total_students += 1
  end

end
