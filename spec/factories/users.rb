FactoryBot.define do
  factory :user do
    firstname { '神谷' }
    lastname { '涼太' }
    firstname_alias { 'カミヤ' }
    lastname_alias { 'リョウタ' }
    email { 'kkk@gmail.com' }
    nickname { 'abe' }
    birthday { '1996-07-10' }
    password { 'aiueo10' }
    password_confirmation { password }
  end
end
