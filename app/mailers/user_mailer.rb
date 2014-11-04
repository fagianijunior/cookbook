class UserMailer < ActionMailer::Base
  default from: "fagianijunior@hotmail.com"
  
  def send_confirmation_mail(user)
    @user = user
    
    mail(to: @user.email, subject: 'Bem vindo ao Cookbook')
  end
end