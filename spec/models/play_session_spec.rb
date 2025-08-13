require "rails_helper"

RSpec.describe PlaySession, type: :model do
  let(:user)     { create(:user) }
  let(:scenario) { create(:scenario) }

  describe "validations" do
    it "allows ended_at to be nil on create (in-progress session)" do
      play_session = build(
        :play_session,
        user: user,
        scenario: scenario,
        started_at: Time.zone.now,
        ended_at: nil
      )
      expect(play_session).to be_valid
    end

    it "requires ended_at on update" do
      play_session = create(
        :play_session,
        user: user,
        scenario: scenario,
        started_at: Time.zone.now,
        ended_at: nil
      )
      play_session.ended_at = nil
      expect(play_session).not_to be_valid
      expect(play_session.errors[:ended_at]).to include(/can't be blank/)
    end

    it "is invalid when ended_at is before started_at" do
      play_session = build(
        :play_session,
        user: user,
        scenario: scenario,
        started_at: Time.zone.now,
        ended_at: 1.hour.ago
      )
      expect(play_session).not_to be_valid
      expect(play_session.errors[:ended_at]).to include(/must be greater than or equal to/)
    end

    it "prevents duplicate sessions for same user+scenario at the same started_at second" do
      t = Time.zone.now.change(usec: 0)
      create(:play_session, user: user, scenario: scenario, started_at: t)
      dup = build(:play_session, user: user, scenario: scenario, started_at: t)
      expect(dup).not_to be_valid
      expect(dup.errors[:started_at]).to be_present
    end
  end
end
