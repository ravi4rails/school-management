class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def active_students
    @active_batches = Batch.where(:is_active => true).includes(:students)
  end

  def inactive_students
    @inactive_batches = Batch.where(:is_active => false).includes(:students)
  end

  def student_guardians
    @student = Student.find(params["student_guardians"]["student_id"])
    @guardian = Guardian.create(:student_id => @student.id, :first_name => params["student_guardians"]["first_name"], :last_name => params["student_guardians"]["last_name"], :age => params["student_guardians"]["age"], :contact => params["student_guardians"]["contact"], :address => params["student_guardians"]["address"], :city => params["student_guardians"]["city"], :state => params["student_guardians"]["state"], :country => params["student_guardians"]["country"], :relation => params["student_guardians"]["relation"])
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :middle_name, :last_name, :batch_id, :date_of_birth, :admission_date, :enrollment_date, :admission_number, :enrollment_number, :email, :relegion, :category, :contact, :city, :state, :country, :course_id, :address, :age)
    end
end
