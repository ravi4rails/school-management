class Event < ActiveRecord::Base
  validates :title, :description, :start_time, :end_time, :presence => true
end
