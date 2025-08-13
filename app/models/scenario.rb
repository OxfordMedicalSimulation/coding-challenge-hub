# frozen_string_literal: true

class Scenario < ApplicationRecord
  has_many :play_sessions, dependent: :destroy

  MODALITIES = %w[desktop vr].freeze
  validates :modality, inclusion: { in: MODALITIES }
  validates_presence_of :title

  scope :desktop, -> { where(modality: "desktop") }
  scope :vr, -> { where(modality: "vr") }

  # TODO: add a scope `recent` that orders by created_at in descending order
end
