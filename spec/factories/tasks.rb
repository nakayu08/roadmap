FactoryBot.define do
  factory :task do
    title                 { Faker::Book.title }
    start_time             {Faker::Date.between(from: 1.year.ago, to: 10.days.ago)}
    end_time               {start_time + 3}
    category_id            {Faker::Number.between(from: 2, to: 6)}
    condition_id           {Faker::Number.between(from: 2, to: 4)}
    explanation            {Faker::Lorem.sentence}
  end
end