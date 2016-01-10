Manticore::Application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/api' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :venues, defaults: { resource: 'Venue' }
    end
  end

  authenticated :user do
    root to: 'static#home', as: :authenticated_root
  end

  unauthenticated do
    root to: 'static#home'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users
  resources :venues
  resources :examples

  get 'static/home'
end
