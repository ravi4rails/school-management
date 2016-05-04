class Employee < ActiveRecord::Base
  belongs_to :department
  validates :first_name, :middle_name, :last_name, :age, :email, :date_of_joining, :date_of_birth, :qualification, :presence => true
  validates :email, :uniqueness => true
  validates :age, :numericality => true
end
