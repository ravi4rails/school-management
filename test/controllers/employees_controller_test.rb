require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { address: @employee.address, age: @employee.age, city: @employee.city, contact: @employee.contact, country: @employee.country, date_of_birth: @employee.date_of_birth, date_of_joining: @employee.date_of_joining, department_id: @employee.department_id, email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, middle_name: @employee.middle_name, qualification: @employee.qualification, state: @employee.state }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { address: @employee.address, age: @employee.age, city: @employee.city, contact: @employee.contact, country: @employee.country, date_of_birth: @employee.date_of_birth, date_of_joining: @employee.date_of_joining, department_id: @employee.department_id, email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, middle_name: @employee.middle_name, qualification: @employee.qualification, state: @employee.state }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
