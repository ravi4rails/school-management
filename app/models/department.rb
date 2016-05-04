class Department < ActiveRecord::Base
  has_many :courses
  validates :name, :presence => true, :uniqueness => true
end
