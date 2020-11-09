FactoryBot.define do
  factory :group do
    name { Faker::Name.unique.name[5..200] }
  end
end
