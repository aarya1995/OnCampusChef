Oncampuschef::Application.routes.draw do



  get "static_pages/pricing"
  get "static_pages/about"
  get "static_pages/chefs"
  resources :end_users
  resources :pot_users
  resources :consultations

  match '/EatSmart', to: 'end_users#menu1', via: 'get'
  match '/AsianFusion', to: 'end_users#AsianFusion', via: 'get'
  match '/SouthAsian', to: 'end_users#SouthAsian', via: 'get'
  match '/ChineseKorean', to: 'end_users#ChineseKorean', via: 'get'
  match '/AmericanDelight', to: 'end_users#AmericanDelight', via: 'get'
  match '/ClassicLiving', to: 'end_users#ClassicLiving', via: 'get'
  match '/SpecialtySandwiches', to: 'end_users#SpecialtySandwiches', via: 'get'
  match '/bodybuilding', to: 'end_users#bodybuilding', via: 'get'

  match '/chefs', to: 'static_pages#chefs', via: 'get'

  get 'pages/index' => 'high_voltage/pages#show', id: 'index'
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
