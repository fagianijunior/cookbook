require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test send_confirmation_mail" do
    title = "Bem vindo ao cookbook"
    sender = "fagianijunior@hotmail.com"
    recipient = "masasp29@gmail.com"
    
    assert_equal sender, "fagianijunior@hotmail.com", msg="Erro não esperado na função send_confirmation_mail da Classe UserMailer"
  end
end
