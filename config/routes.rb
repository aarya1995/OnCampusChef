Oncampuschef::Application.routes.draw do

  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  get "static_pages/pricing"
  get "static_pages/about"
  get "static_pages/about_us"
  get "static_pages/chefs"
  get "static_pages/test"
  get "static_pages/test2"

  get "temp_order/order" # This is to be deleted later 
  
 

  resources :end_users
  resources :pot_users
  resources :consultations
  resources :healthy_living
  resources :orders, :except => [:show]
  resources :athlete
  resources :homestyle
  resources :budget
  resources :vegetarian
  resources :catering_orders


  get "orders/athlete" => "orders#athlete"
  get "orders/healthyliving" => "orders#healthyliving"
  get "orders/homestyle" => "orders#homestyle"
  get "orders/budget" => "orders#budget"
  get "orders/vegetarian" => "orders#vegetarian"
  get "orders/food_picker" => "orders#food_picker"
  post "orders/price" => "orders#price"

  get "food_objects/menu"
 
  match '/chefs', to: 'static_pages#chefs', via: 'get'
  match '/profile', to: 'customers#show', via: 'get'
  match '/catering', to: 'catering_orders#new', via: 'get'

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
