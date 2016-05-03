module ApplicationHelper

  def batch_details(batch_id)
    @batch = Batch.find(batch_id)
    "#{@batch.course.try(:name)}"
  end

  def subject_of_course(course)
    Subject.all - course.subjects
  end

  def subject_of_section(course)
    course.course_subjects
  end

end
