class Batch < ActiveRecord::Base
  belongs_to :course
  has_many :students
  has_many :sections
  validates :start_year, :end_year, :course_id, :presence => true

  def name
    "#{self.course.try(:name)} #{self.start_year.strftime('%Y')} #{'-'} #{self.end_year.strftime('%Y')}"
  end
end
