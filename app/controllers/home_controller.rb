class HomeController < ApplicationController

  before_action :set_admin_layout, :only => [:admin_dashboard, :work_allotment, :settings, :admission]

  def index
  end

  def student_dashboard
    render :layout => "student"
  end

  def my_profile
    render :layout => "student"
  end

  def employee_dashboard
  end

  def employee_profile
  end

  def admin_dashboard
  end

  def admission
  end

  def settings
  end

  def work_allotment
  end

  private

    def set_admin_layout
      render :layout => "admin"
    end

end
