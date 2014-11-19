require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  test "send_confirmation_mail" do
    user = users(:marcelo)
    user.activation_token = User.new_token
    
    mail = UserMailer.send_confirmation_mail
    
    assert_equal "Bem vindo ao Cookbook", mail.object
    assert_equal ["fagianijunior@hotmail.com"], mail.from
    
    assert_match user.name, mail.body.encored
    assert_match user.activation_token, mail.body.encored
  end
  
  test "send_alteration_password_mail" do
    mail = UserMailer.send_alteration_password_mail
    assert_equal "Bem vindo ao Cookbook", mail.object
    assert_equal ["fagianijunior@hotmail.com"], mail.from
  end      
  
end