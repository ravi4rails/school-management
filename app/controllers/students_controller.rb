class StudentsController < ApplicationController
  layout 'admin'
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @search = Student.search(params[:q])
    @students = @search.result
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create_student
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

  def update_student
    @student = Student.find(params[:student][:id])
    respond_to do |format|
      if @student.update_attributes(update_student_params)
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

  def find_student
    @section = Section.find(params[:find_student][:section])
    @students = @section.students
  end

  def get_department_courses
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def get_course_batches
    @course = Course.find(params[:course_id])
    @batches = @course.batches.where(:is_active => true)
  end

  def get_batch_sections
    @batch = Batch.find(params[:batch_id])
    @sections = @batch.sections
  end

  def find_batch_students
    @batch = Batch.find(params[:find_batch_students][:batch])
    @students = @batch.students
  end

  def get_department_courses_batch
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def get_course_batches_batch
    @course = Course.find(params[:course_id])
    @batches = @course.batches.where(:is_active => true)
  end

  def find_course_students
    @course = Course.find(params[:find_course_students][:course])
    @students = @course.students
  end

  def get_department_courses_course
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def find_previous_class_students
    @section = Section.find(params[:find_previous_class_students][:section])
    @students = @section.students
  end

  def find_previous_batch_students
    @batch = Batch.find(params[:find_previous_batch_students][:batch])
    @students = @batch.students
  end

  def find_previous_course_students
    @course = Course.find(params[:find_previous_course_students][:course])
    @students = @course.students
  end

  def get_department_courses_previous_students
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def get_course_batches_previous_students
    @course = Course.find(params[:course_id])
    @batches = @course.batches.where(:is_active => false)
  end

  def get_batch_sections_previous_students
    @batch = Batch.find(params[:batch_id])
    @sections = @batch.sections
  end

  def get_department_courses_batch_previous_students
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def get_course_batches_batch_previous_students
    @course = Course.find(params[:course_id])
    @batches = @course.batches.where(:is_active => false)
  end

  def get_department_courses_course_previous_students
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def search_students
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :middle_name, :last_name, :batch_id, :date_of_birth, :admission_date, :enrollment_date, :admission_number, :enrollment_number, :email, :relegion, :category, :contact, :city, :state, :country, :course_id, :address, :age, :latitude, :longitude, :profile_picture, :section_id)
    end

    def update_student_params
      params.require(:student).permit(:id, :first_name, :middle_name, :last_name, :batch_id, :date_of_birth, :admission_date, :enrollment_date, :admission_number, :enrollment_number, :email, :relegion, :category, :contact, :city, :state, :country, :course_id, :address, :age, :latitude, :longitude, :profile_picture, :section_id)
    end
end
