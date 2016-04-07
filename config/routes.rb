Rails.application.routes.draw do
  resources :demanded_skills
  resources :prerequisits
  resources :endorsements
  resources :user_skill_assignments
  resources :skill_levels
  resources :prerequisites
  resources :endorsements
  resources :replies
  resources :conversations
  resources :demanded_skills
  resources :materials
  resources :skills
  devise_for :users
  get 'my_skills/' => 'user_skill_assignments#myskills', :as => 'myskills'
  get 'my_skills/new' => 'user_skill_assignments#myskills_new', :as => 'myskills_new'  
  get 'my_skills/destroy/:id' => 'user_skill_assignments#myskills_destroy', :as => 'myskills_destroy'  
  get 'my_skills/:id' => 'user_skill_assignments#myskills_show', :as => 'myskills_show'
  get 'user/:id' => 'users#show', :as => 'user_show'
  get 'endorse/:user_skill_assignments_id' => 'endorsements#ajax_create', :as => 'endorse_user'
  get 'unendorse/:id' => 'endorsements#ajax_destroy', :as => 'unendorse_user'
	
  #for customer devise controller!
  #devise_for :users, controllers: { sessions: "users/sessions" }
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

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
