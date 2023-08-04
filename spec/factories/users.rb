FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            { Gimei.name.first.kanji }
    last_name             { Gimei.name.last.kanji }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end