class UserMailer < ActionMailer::Base
  default from: "fagianijunior@hotmail.com"
  
  def send_confirmation_mail(user)
    @user = user
    
    mail(to: @user.email, subject: "Bem vindo ao Cookbook")
  end
  
  def send_alteration_password_mail(user)
    @user = user
    
    mail(to: @user.email, subject: "Alteração da senha do Cookbook")
  end
end