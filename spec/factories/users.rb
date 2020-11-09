FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name[5..20] }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
