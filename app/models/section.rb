class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :batch
  has_many :students
  has_many :section_subjects
end
