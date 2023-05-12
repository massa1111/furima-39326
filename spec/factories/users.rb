FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    last_name             {'山田'}
    first_name            {'陸太'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'リクタ'}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    birth_date            {Faker::Date.birthday(min_age: 4, max_age: 80)}
  end
end

