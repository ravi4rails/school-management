class McapsMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(employee)
    @employee = employee
    @url  = 'http://example.com/login'
    mail(to: @employee.email, subject: 'Welcome To SCSERP')
  end

  def notification_email(employee, task)
    @employee = employee
    @task = task
    @url  = 'http://example.com/login'
    mail(to: @employee.email, subject: 'Task Notification Mail')
  end

end
