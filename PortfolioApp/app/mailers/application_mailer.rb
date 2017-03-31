class ApplicationMailer < ActionMailer::Base
  #default from: 'from@example.com'
  #layout 'mailer'

   default :from => "contehbub@gmail.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Registration Confirmation")
 end
end
