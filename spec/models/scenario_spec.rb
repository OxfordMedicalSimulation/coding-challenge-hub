require 'rails_helper'

RSpec.describe Scenario, type: :model do
  let(:scenario) { build(:scenario) }

  describe 'validations' do
    it 'should not be valid when modality is not present' do
      scenario.modality = nil
      expect(scenario).not_to be_valid
    end

    it 'should not be valid when modality is not recognised' do
      scenario.modality = :unknown
      expect(scenario).not_to be_valid
    end

    # TODO: Complete test confirming :desktop and :vr are valid modality enum attributes
    xit 'should be valid when modality is one of :desktop or :vr' do
    end
  end

  describe "scope recent" do
    it "orders newest first" do
      newest = create(:scenario, created_at: 0.days.ago)
      create(:scenario, created_at: 1.days.ago)
      create(:scenario, created_at: 2.days.ago)

      expect(Scenario.recent.first).to eq(newest)
    end
  end
end
