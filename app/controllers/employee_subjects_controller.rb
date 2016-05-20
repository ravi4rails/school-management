class EmployeeSubjectsController < ApplicationController
  layout 'admin'
  before_action :set_employee_subject, only: [:show, :edit, :update, :destroy]

  def index
    @employee_subjects = EmployeeSubject.all
  end

  def show
  end

  def new
    @employee_subject = EmployeeSubject.new
  end

  def edit
  end

  def create
    @employee_subject = EmployeeSubject.new(employee_subject_params)
    respond_to do |format|
      if @employee_subject.save
        format.js
        format.html { redirect_to @employee_subject, notice: 'Employee subject was successfully created.' }
        format.json { render :show, status: :created, location: @employee_subject }
      else
        format.js
        format.html { render :new }
        format.json { render json: @employee_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee_subject.update(employee_subject_params)
        format.js
        format.html { redirect_to @employee_subject, notice: 'Employee subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_subject }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @employee_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee_subject.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to employee_subjects_url, notice: 'Employee subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_employee_subject
      @employee_subject = EmployeeSubject.find(params[:id])
    end

    def employee_subject_params
      params.require(:employee_subject).permit(:employee_id, :subject_id, :department_id, :course_id)
    end
end
