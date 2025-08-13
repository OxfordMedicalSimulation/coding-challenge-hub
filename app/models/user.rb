# frozen_string_literal: true

class User < ApplicationRecord
  has_many :play_sessions, dependent: :destroy
  has_many :feedbacks, through: :play_sessions

  validates_presence_of :first_name, :last_name

  # OPTIMIZE: move presentation code to a presentation class (see app/presenters)
  def full_name
    [first_name, last_name].compact_blank.join(' ')
  end
end
