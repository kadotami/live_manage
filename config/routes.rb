Wuk::Application.routes.draw do
  root :to => "top#index"
  get "/error", to: 'top#error'
  get "/login", to: 'sessions#new'
  get "/signup", to: 'users#new'
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
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
