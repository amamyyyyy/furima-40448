FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number:2)}
    email {Faker::Internet.email}
    password {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name { '田中' }
    family_name { '太郎' }
    first_name_kana { 'タナカ' }
    family_name_kana { 'タロウ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end