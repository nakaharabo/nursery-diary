FactoryBot.define do
  factory :user do
    child_nickname { Faker::Name.initials(number: 2) }
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name  { '中原' }
    first_name { '翔大' }
    last_name_kana { 'ナカハラ' }
    first_name_kana { 'ショウタ' }
    parent_name  { '中原美奈子' }
  end
end
