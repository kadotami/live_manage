Wuk::Application.routes.draw do
  root :to => "top#index"
  get "/error", to: 'top#error'
  get "/login", to: 'sessions#new'
  get "/signup", to: 'users#new'

  resources :users, only: [:new, :create, :destroy]

  resources :big_concert_bands

  resources :small_concert_bands

  resources :big_concerts

  resources :small_concerts

  namespace :admin do
    get "/" , to: 'top#index'
    resources :small_concerts
    resources :small_concert_bands do
      collection do
        get :manage
      end
    end
    resources :big_concerts
    resources :big_concert_bands do
      collection do
        get :manage
      end
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  get '/signin',  to: 'sessions#new',         via: 'get'
  get '/signout', to: 'sessions#destroy',     via: 'delete'

  get '*path', :controller => 'application', :action => 'render_404'
end
