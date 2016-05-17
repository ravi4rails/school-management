class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  belongs_to :department
  has_many :employee_subjects
  has_many :subjects, :through => :employee_subjects
  has_many :employee_tasks
  has_many :tasks, :through => :employee_tasks
  validates :first_name, :middle_name, :last_name, :age, :email, :date_of_joining, :date_of_birth, :qualification, :presence => true
  validates :email, :uniqueness => true
  validates :age, :numericality => true
  mount_uploader :profile_picture, ImageUploader
  geocoded_by :full_address
  after_validation :geocode
  before_create :my_password

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def full_address
    "#{city} #{state} #{country}"
  end

  def my_password
    self.encrypted_password = BCrypt::Password.create(SecureRandom.hex(4))
  end

end