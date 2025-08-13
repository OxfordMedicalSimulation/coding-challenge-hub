# frozen_string_literal: true

class PlaySession < ApplicationRecord
  belongs_to :user
  belongs_to :scenario
  has_one :feedback, dependent: :destroy

  accepts_nested_attributes_for :feedback

  before_validation :truncate_started_at

  validates_presence_of :ended_at, unless: :new_record?
  validates_comparison_of :ended_at, greater_than_or_equal_to: :started_at, allow_nil: true
  validates_uniqueness_of :started_at, scope: %i[ user_id scenario_id ]

  private

  # We want second resolution for validation purposes
  def truncate_started_at
    self.started_at = started_at&.change(usec: 0)
  end
end
