Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
  root to: 'pages#home'
  get 'transporteur', to: 'pages#home_transporteur'

  # page de vue de profile - A PROTEGER
  get 'profile' => 'users#profile'
  get 'users/:id', to: 'users#show', as: :show_user

  resources :trips

  get 'users/:id', to: 'users#show', as: :show_user
  get 'users/:id/usercard', to: 'users#show_card', as: :show_user_card

  resources :missions do
    put :update_mission_with_trip, to: "trips#update_mission_with_trip"
    get 'trips/search', to: 'trips#search'
    member do
      post 'check_start', to: 'missions#check_start_code'
      post 'check_end', to: 'missions#check_end_code'
    end
  end



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
