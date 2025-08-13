Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :scenarios, only: [ :index, :show ]
    resources :users, only: [ :index, :show ] do
      get :feedback, on: :member
    end
    resources :play_sessions, only: [ :create ]
  end
end
