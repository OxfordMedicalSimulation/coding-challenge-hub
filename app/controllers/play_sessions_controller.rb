class PlaySessionsController < ApplicationController
  # FIXME: missing strong params check
  def create
    play_session = PlaySession.new(params[:play_session])

    if play_session.save
      render json: play_session, status: :created
    else
      render json: { errors: play_session.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
