FactoryBot.define do
  factory :group do
    name { Faker::Name.unique.name[5..60] }
    icon { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/no_group.png", 'image/png') }
    association :author, factory: :user
  end
end
