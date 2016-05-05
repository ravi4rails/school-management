require 'test_helper'

class EmployeeSubjectsControllerTest < ActionController::TestCase
  setup do
    @employee_subject = employee_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_subject" do
    assert_difference('EmployeeSubject.count') do
      post :create, employee_subject: { employee_id: @employee_subject.employee_id, subject_id: @employee_subject.subject_id }
    end

    assert_redirected_to employee_subject_path(assigns(:employee_subject))
  end

  test "should show employee_subject" do
    get :show, id: @employee_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_subject
    assert_response :success
  end

  test "should update employee_subject" do
    patch :update, id: @employee_subject, employee_subject: { employee_id: @employee_subject.employee_id, subject_id: @employee_subject.subject_id }
    assert_redirected_to employee_subject_path(assigns(:employee_subject))
  end

  test "should destroy employee_subject" do
    assert_difference('EmployeeSubject.count', -1) do
      delete :destroy, id: @employee_subject
    end

    assert_redirected_to employee_subjects_path
  end
end
