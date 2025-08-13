# frozen_string_literal: true

class UserPresenter
  attr_reader :user

  def self.collection(users)
    users.map { |u| new(u).as_json }
  end

  def initialize(user)
    @user = user
  end

  # FIXME: JSON is missing last_played_at value, create a method to determine users last `play_session` by `ended_at` attribute
  def as_json(*)
    {
      id: user.id,
      email: user.email,
      full_name: user.full_name
    }
  end
end
