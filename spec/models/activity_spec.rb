require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:activity) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_length_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than(9) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:group).optional }
  end
end
