class HomeController < ApplicationController
  def index
  end

  def student_dashboard
  end

  def my_profile
  end

  def employee_dashboard
  end

  def employee_profile
  end

  def admin_dashboard
    render :layout => "admin"
  end

  def admission
    render :layout => "admin"
  end

  def settings
    render :layout => "admin"
  end

end
