FactoryBot.define do
  factory :activity do
    name { Faker::Name.unique.name[5..250] }
    amount { Faker::Number.between(from: 10, to: 1000) }
    association :author, factory: :user
    association :group
  end
end
