class EmployeesController < ApplicationController
  layout 'admin'
  before_action :set_employee, only: [:show, :edit, :destroy]

  def index
    @search = Employee.search(params[:q])
    @employees = @search.result
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create_employee
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        # McapsMailer.welcome_email(@employee).deliver_now
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_employee
    @employee = Employee.find(params[:employee][:id])
    respond_to do |format|
      if @employee.update_attributes(update_employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :middle_name, :last_name, :city, :state, :country, :email, :contact, :address, :date_of_birth, :age, :date_of_joining, :qualification, :department_id, :latitude, :longitude, :profile_picture)
    end

    def update_employee_params
      params.require(:employee).permit(:id, :first_name, :middle_name, :last_name, :city, :state, :country, :email, :contact, :address, :date_of_birth, :age, :date_of_joining, :qualification, :department_id, :latitude, :longitude, :profile_picture)
    end
end
