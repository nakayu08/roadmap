FactoryBot.define do
  factory :comment do
    text { "MyText" }
    user_id { 1 }
    task_id { 1 }
  end
end
