class McapsMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(employee)
    @employee = employee
    @url  = 'http://example.com/login'
    mail(to: @employee.email, subject: 'Welcome To MCAPS')
  end
end
