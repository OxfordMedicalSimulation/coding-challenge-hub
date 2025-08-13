class ScenariosController < ApplicationController
  def index
    # FIXME: This should be ordered by created_at in descending order. Add a new scope `recent` in Scenario model and use here
    scenarios = Scenario.limit(params.fetch(:per, 25))

    render json: scenarios.map do |scenario|
      {
        id: s.id,
        title: s.title,
        last_played_at: scenarios.play_sessions.max_by(&:ended_at)&.ended_at,
        last_feedback_note: scenario.play_sessions.map { |ps| ps.feedback&.notes }.compact.first
      }
    end
  end

  def show
    scenario = Scenario.find(params[:id])
    render json: scenario
  end
end
