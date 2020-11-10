require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:groups) }
    it { should have_many(:activities) }
    it { should have_many(:ungrouped_activities) }
  end
end
