FactoryBot.define do
  factory :user do
    nickname { Faker::Name.middle_name }
    email { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { '長尾' }
    last_name { '光' }
    family_name_kana { 'ナガオ' }
    last_name_kana { 'ヒカル' }
    birthday { Faker::Date.birthday }
  end
end
