require 'rails_helper'

RSpec.describe UserPresenter do
  describe '#as_json' do
    it 'renders expected data' do
      user = build(:user)
      json = described_class.new(user).as_json
      expect(json.keys).to eq(%i[id email full_name last_played_at])
    end

    it 'renders full_name from first/last names' do
      user = build(:user, first_name: 'Ada', last_name: 'Lovelace')
      json = described_class.new(user).as_json
      expect(json[:full_name]).to eq('Ada Lovelace')
    end

    it 'handles missing parts gracefully' do
      user = build(:user, first_name: 'Prince', last_name: nil)
      json = described_class.new(user).as_json
      expect(json[:full_name]).to eq('Prince')
    end

    it 'renders last_played_at' do
      user = create(:user)
      create(:play_session, user:, started_at: Time.current - 2.hours, ended_at: Time.current - 1.hours)
      last_play_session = create(:play_session, user:)
      create(:play_session, user:, started_at: Time.current - 3.hours, ended_at: Time.current - 2.hours)

      json = described_class.new(user).as_json
      expect(json[:last_played_at]).to eq(last_play_session.ended_at)
    end
  end
end
