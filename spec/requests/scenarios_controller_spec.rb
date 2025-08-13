require 'rails_helper'

RSpec.describe 'ScenariosController', type: :request do
  let!(:user)     { create(:user) }
  let!(:scenario) { create(:scenario) }
  let!(:sessions) do
    create_list(:play_session, 2, user:, scenario:).each do |ps|
      create(:feedback, play_session: ps)
    end
  end

  describe 'GET /scenarios' do
    it 'returns ok' do
      get scenarios_path
      expect(response).to have_http_status(:ok)
    end

    it 'orders newest first' do
      new = create(:scenario, created_at: Time.current)
      create(:scenario, created_at: 2.days.ago)
      expect(Scenario.recent.first).to eq(new)
    end
  end
end
