Oncampuschef::Application.routes.draw do

  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  get "static_pages/why_us"
  get "static_pages/pricing"
  get "static_pages/what_we_do"
  get "static_pages/bbq"


  resources :charges, :except => [:show]
  resources :orders, :except => [:show]
  resources :barbecue_orders, :except => [:show]
  resources :barbecue_charges, :except => [:show]


 
  get "orders/vegetarian" => "orders#vegetarian"
  get "orders/food_picker" => "orders#food_picker"
  get "orders/test" => "orders#test"
  get "orders/test2" => "orders#test2"
  get "orders/quantity" => "orders#quantity"
  post "orders/new" => "orders#new"

  #barbecue routes
  get "barbecue_orders/new"


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
