Manticore::Application.routes.draw do
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
  resources :examples

  get 'static/home'
end
