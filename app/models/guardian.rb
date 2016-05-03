class Guardian < ActiveRecord::Base
  belongs_to :student

  def name
    "#{first_name} #{last_name}"
  end

end
