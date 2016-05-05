class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :students
  validates :start_year, :end_year, :course_id, :presence => true
end
