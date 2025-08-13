# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :play_session

  # TODO: validate score between 0 and 100
end
