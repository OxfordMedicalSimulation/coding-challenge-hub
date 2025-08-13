require "rails_helper"

RSpec.describe "PlaySessionsController", type: :request do
  let!(:user)     { create(:user) }
  let!(:scenario) { create(:scenario) }

  let(:payload) do
    {
      play_session: {
        user_id: user.id,
        scenario_id: scenario.id,
        started_at: Time.zone.now.change(usec: 0),
        ended_at: nil,
        created_at: 5.years.ago,
        feedback: {
          score: 90,
          notes: "nice"
        }
      }
    }
  end

  describe "POST /play_sessions" do
    it "creates a play session and ignores forbidden attributes" do
      expect {
        post play_sessions_path, params: payload
      }.to change(PlaySession, :count).by(1)

      expect(response).to have_http_status(:created)

      play_session = PlaySession.last
      expect(play_session.user_id).to eq(user.id)
      expect(play_session.scenario_id).to eq(scenario.id)
    end

    it "ignores forbidden attributes" do
      expect {
        post play_sessions_path, params: payload
      }.to change(PlaySession, :count).by(1)

      expect(response).to have_http_status(:created)

      play_session = PlaySession.last
      expect(play_session.created_at).to be > 1.day.ago
    end
  end
end
