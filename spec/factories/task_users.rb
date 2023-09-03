FactoryBot.define do
  factory :task_user do
    association :user
    association :task
  end
end
