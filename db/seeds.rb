
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gender = Gender.find_or_create_by(name: 'Masculino')
gender = Gender.find_or_create_by(name: 'Feminino')

TypePost.create(name: "Micropost")
TypePost.create(name: "Receita")

User.create(
  first_name: "marcelo",
  last_name: "aguiar silva",
  avatar: nil,  email: "masasp29@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "2014-11-17",
  gender_id: 1,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: nil
)

User.create(
  first_name: "Carlos",
  last_name: "Fagiani Junior",
  avatar: nil,
  email: "fagianijunior@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "1985-10-28",
  gender_id: 1,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-11-17 17:54:46"
)

User.create(
  first_name: "marcelo",
  last_name: "aguiar silva",
  avatar: nil,
  email: "marcelo_.aguiar@hotmail.com.br",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "2014-11-17",
  gender_id: 1,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-11-17 18:30:26"
)

User.create(
  first_name: "Letícia",
  last_name: "FAGIANI",
  avatar: nil,
  email: "tih.fah@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "1984-01-13",
  gender_id: 2,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-11-17 23:58:07"
)

User.create(
  first_name: "Larissa",
  last_name: "Cordeiro",
  avatar: nil,
  email: "fagianijunior1@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "1985-10-28",
  gender_id: 2,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-11-26 20:59:54"
)

User.create(
  first_name: "Aleteia",
  last_name: "Fagiani",
  avatar: nil, email: "fagianijunior@hotmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "2014-11-27",
  gender_id: 2,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-11-27 20:22:38"
)

User.create(
  first_name: "nadia",
  last_name: "lima vasconcelos",
  avatar: nil,
  email: "nadialimaa@hotmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "2014-12-03",
  gender_id: 1,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-12-03 02:11:07"
)

User.create(
  first_name: "Larissa",
  last_name: "Cordeiro",
  avatar: nil,
  email: "larissacordeiro01@icloud.com",
  password: "12345678",
  password_confirmation: "12345678",
  birth: "1983-12-23",
  gender_id: 2,
  email_confirmed: true,
  password_reset_token: nil,
  password_reset_sent_at: "2014-12-03 13:42:26"
)