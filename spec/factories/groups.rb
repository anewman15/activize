FactoryBot.define do
  factory :group do
    name { Faker::Name.unique.name[5..60] }
    association :author, factory: :user
  end
end
