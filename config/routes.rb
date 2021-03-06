Ploutos::Application.routes.draw do
  get "overviews/index"
  resources :fixed_costs
  resources :types
  resources :incomes
  resources :sudden_checks

  patch "update_data"   => "users#update_data"
  patch "edit_password"    => "users#update_password"

  get "edit_data" => "users#edit_data"

  get "sign_in"       => "users#sign_in"
  get "sign_up"       => "users#sign_up"
  get "log_in"        => "users#log_in"
  post "new_user"     => "users#create"
  post "activate"     => "users#activate"  
  get "deactivate"    => "users#deactivate"
  get "edit_password" => "users#edit_password"

  get "due_payments"  => "bills#index"
  patch "due_payments/:id" => "bills#pay", as: :bill

  root 'overviews#index' 
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
