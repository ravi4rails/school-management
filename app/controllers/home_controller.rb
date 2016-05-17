class HomeController < ApplicationController
  def index
  end

  def student_dashboard
  end

  def my_profile
    @student = Student.find(params[:student_id])
  end

  def employee_dashboard
  end

end
