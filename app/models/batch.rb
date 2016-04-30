class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :students
end
