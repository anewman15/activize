require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:group) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:author_id).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:activities) }
  end
end
