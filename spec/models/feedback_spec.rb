require 'rails_helper'

RSpec.describe Feedback, type: :model do
  let(:feedback) { build(:feedback) }

  describe 'validations' do
    it 'should not be valid when score is not present' do
      feedback.score = nil
      expect(feedback).not_to be_valid
    end

    it 'should not be valid when score is less than 1' do
      feedback.score = -1
      expect(feedback).not_to be_valid
    end

    it 'should not be valid when score is greater than 100' do
      feedback.score = 101
      expect(feedback).not_to be_valid
    end

    it 'should valid when score is equal to 0' do
      feedback.score = 0
      expect(feedback).to be_valid
    end

    it 'should valid when score is equal to 100' do
      feedback.score = 100
      expect(feedback).to be_valid
    end
  end
end
