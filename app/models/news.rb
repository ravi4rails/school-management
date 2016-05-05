class News < ActiveRecord::Base
  validates :title, :content, :presence => true
end
