FactoryBot.define do
  factory :user do
    name { Faker::Name.name[5..50] }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
