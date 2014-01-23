require 'digest/sha2'

Artsbox::Application.routes.draw do



  root "home#index"
  
  # various pages like faqs, about, terms etc
  match "/terms-of-service", :to => "pages#terms_of_service", via: [:get]
  
  # routes for authentication etc
  match "/login", :to => "sessions#new", via: [:get, :post]
  match "/logout", :to => "sessions#destroy", via: [:get, :post]
  match "/new-password", :to => "sessions#send_new_password", via: [:get, :post]
  match "/resend-account-activation", :to => "sessions#resend_new_account_email", via: [:get, :post]
  match :session
#  
#  # routes for general public page views
#  get "signup-home-page", :controller => "home", :action => "new_user"
#  get "/signup", :controller => "signup", :action => "signup"
#  get "signup-page-new-user", :controller => "signup", :action => "new_user"  
#  
#  get "user/activation/:id", :controller => "users", :action => "activation"
#  get ":permalink", :controller => "users", :action => "show"
#  get ":permalink/edit", :controller => "users", :action => "edit"
#  get ":permalink/update", :controller => "users", :action => "update"
#  
#  # Account.
#  get :account, :path_prefix => ":permalink"  
#  
#  #nested  
#  match.resources :users do |users|
#    users.resources :posts,       :path_prefix => ":permalink"
#    users.resources :images,      :path_prefix => ":permalink"    
#    users.resources :feeds,       :path_prefix => ":permalink"
#    users.resources :events,      :path_prefix => ":permalink"
#    users.resources :friends,     :path_prefix => ":permalink"
#    users.resources :galleries,   :path_prefix => ":permalink"
#    users.resources :items,       :path_prefix => ":permalink"
#    users.resources :styles,      :path_prefix => ":permalink"
#    users.resources :friendships, :path_prefix => ":permalink" 
#    users.resources :newsletters, :user => {:sendmail => :put}    
#    
##    users.resources :items do |items|
##      items.resources  :images, :path_prefix => ":permalink/:item"
##    end
#    
#    users.resources :posts do |posts|
#      posts.resources :comments, :path_prefix => ":permalink/:post"
#    end
#  end
#  
#  # username url
#  match.permalink ":permalink", :controller => "users", :action => "show"
#  match.edit_box ":permalink/edit", :controller => "users", :action => "edit"
#  match.update_box ":permalink", :controller => "users", :action => "update"  
#  
#  # catch all
#  match.catch_all "#{RAILS_ROOT}/public/404.html", :controller => "catch_all", :action => "index"
#  match.connect ":permalink/*", :controller => "catch_all", :action => "index"
#  match.connect "*path", :controller => "catch_all", :action => "index"
#
end

##  resources :users
##
##  resources :themes
##
##  resources :terms
##
##  resources :styles
##
##  resources :posts
##
##  resources :newsletters
##
##  resources :images
##
##  resources :friendships
##
##  resources :events
##
##  resources :comments
##
##  resources :accounts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (matchs HTTP verbs to controller actions automatically):
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