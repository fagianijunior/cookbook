class UserMailer < ActionMailer::Base
  default from: "fagianijunior@hotmail.com"
  
  def welcome_email(user)
    @user = user
    
    mail(to: @user.email, subject: 'Bem vindo ao Cookbook')
  end
end
