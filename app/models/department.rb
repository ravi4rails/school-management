class Department < ActiveRecord::Base
  has_many :courses
  has_many :employees
  validates :name, :presence => true, :uniqueness => true
end
