class Section < ActiveRecord::Base
  belongs_to :course
  has_many :section_subjects
end
