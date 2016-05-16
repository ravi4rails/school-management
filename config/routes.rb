Rails.application.routes.draw do
  devise_for :employees
  devise_for :students, controllers: {registrations: 'students/registrations', sessions: 'students/sessions', confirmations: 'students/confirmations', passwords: 'students/passwords'}
  devise_for :admins
  resources :employee_subjects
  resources :news
  resources :tasks do
    collection do
      post :assign_task
      get :get_department_employee
      put :update_task_status
    end
  end
  devise_for :users
  resources :employees
  resources :events  do
    collection do
      get :event_calendar
      get :calendar_events
    end
  end
  resources :students do
    collection do
      post :student_guardians
      get :find_student
      get :find_batch_students
      get :get_department_courses
      get :get_course_batches
      get :get_batch_sections
      get :get_department_courses_batch
      get :get_course_batches_batch
      get :find_course_students
      get :get_department_courses_course
      get :find_previous_class_students
      get :find_previous_batch_students
      get :find_previous_course_students
      get :get_department_courses_previous_students
      get :get_course_batches_previous_students
      get :get_batch_sections_previous_students
      get :get_department_courses_batch_previous_students
      get :get_course_batches_batch_previous_students
      get :get_department_courses_course_previous_students
    end
  end
  resources :batches do
    collection do
      post :batch_section
    end
  end
  get 'home/index'
  root to: "home#index"

  resources :sections
  resources :courses do
    collection do
      post :include_subjects
      post :include_section_subjects
      get :delete_subject
      get :active_batch_list
    end
  end
  resources :subjects
  resources :departments do
    collection do
      get :department_employee
    end
  end

  get '/inactive_students' => "students#inactive_students"
  get '/active_students' => "students#active_students"

  get '/student' => "home#student_dashboard"
end
