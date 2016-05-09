class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @search = Course.search(params[:q])
    @courses = @search.result
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @course }
      else
        format.js
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @course }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def include_subjects
    @course = Course.find(params[:include_subjects][:course_id])
    params[:include_subjects][:subject].delete("")
    subject_array = params[:include_subjects][:subject]
    subject_array.each do |subject|
      CourseSubject.create(:course_id => @course.id, :subject_id => subject.to_i)
    end
  end

  def delete_subject
    @course_subject = CourseSubject.find(params[:course_params_id])
    @course_subject.destroy
  end

  def include_section_subjects
  end

  def active_batch_list
    @course = Course.find(params[:course_id])
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :duration, :department_id)
    end
end
