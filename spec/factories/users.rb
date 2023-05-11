FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    last_name             {Faker::Name.initials(number: 4)}
    first_name            {Faker::Name.initials(number: 4)}
    last_name_kana        {Faker::Name.initials(number: 4)}
    first_name_kana       {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {Faker::Date.birthday(min_age: 4, max_age: 80)}
  end
end

