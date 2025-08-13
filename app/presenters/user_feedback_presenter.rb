# frozen_string_literal: true

class UserFeedbackPresenter
  attr_reader :feedback

  def self.collection(feedback)
    feedback.map { |f| new(f).as_json }
  end

  def initialize(feedback)
    @feedback = feedback
  end

  def as_json(*)
    {
      id: feedback.id,
      scenario_title: feedback.play_session.scenario.title,
      score: feedback.score,
      notes: feedback.notes,
      ended_at: feedback.play_session.ended_at
    }
  end
end
