class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @task }
      else
        format.js
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @task }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_task
    @task = Task.find(params[:assign_task][:task_id])
    params[:assign_task][:employees].delete("")
    employee_array = params[:assign_task][:employees]
    employee_array.each do |employee|
      EmployeeTask.create(:employee_id => employee.to_i, :task_id => @task.id )
    end
  end

  def get_department_employee
    @department = Department.find(params[:department_id])
    @employees = @department.employees
  end

  def update_task_status
    @task = Task.find(params[:task_id])
    @task.update_attributes(:status => "Done")
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end
end
