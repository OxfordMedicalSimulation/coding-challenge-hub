require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let!(:user)     { create(:user) }
  let!(:scenario) { create(:scenario) }
  let!(:sessions) do
    create_list(:play_session, 2, user:, scenario:).each do |ps|
      create(:feedback, play_session: ps)
    end
  end

  describe 'GET /users' do
    it 'returns ok' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'doesn\'t leak sensitive information' do
      get users_path
      user_data = JSON.parse(response.body).first
      expect(user_data.keys).not_to include('password')
    end
  end

  describe 'GET /user/1' do
    it 'returns ok' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'doesn\'t leak sensitive information' do
      get user_path(user)
      user_data = JSON.parse(response.body)
      expect(user_data.keys).not_to include('password')
    end
  end

  describe 'GET /users/1/feedback' do
    it 'returns ok' do
      get feedback_user_path(user.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
