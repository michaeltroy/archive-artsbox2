require 'digest/sha2'

Artsbox::Application.routes.draw do

  root "home#index"
  
  # various pages like faqs, about, terms etc
  match "/terms-of-service", :to => "pages#terms_of_service", as: "terms", via: [:get]
  
  # routes for authentication etc
  match "/login", :to => "sessions#new", via: [:get]
  match "/logout", :to => "sessions#destroy", via: [:post]
  resource :session

  match "/new-password", :to => "sessions#send_new_password", as:'new_password', via: [:post]
  match "/resend-account-activation", :to => "sessions#resend_new_account_email", as: 'resend_password', via: [:get, :post]

  # routes for general public page views
  get "/signup-home-page", :to => "home#new_user"
  get "/signup", :to => "signup#signup"
  post "/signup-new-user", :to => "signup#new_user", :as => "signup_new_user"

  # Users
  get "user/activation/:id", :controller => "users", :action => "activation"
  get ":permalink", :controller => "users", :action => "show"
  get ":permalink/edit", :controller => "users", :action => "edit"
  get ":permalink/update", :controller => "users", :action => "update"

  #resource :user
  match ":permalink", :to => "users#show", as: 'permalink', via: [:get]
  match ":permalink", :to => "users#show", as: 'show_user', via: [:get]
  match ":permalink/edit", :to => "users#edit", as: 'edit_user', via: [:get, :post]
  post ":permalink/update", :to => "users#update", as: 'update_user'

  # Account.
  scope ':permalink' do
    resource :account
  end

  scope ':permalink', as: 'user' do
    resources :posts, :images, :feeds, 
              :events, :friends, 
              :galleries, :items, :styles, 
              :friendships, :newsletters
   # 
   #   resources :items do
   #     resources  :images, :scope => ":permalink/:item"
   #   end
   # 
   #   resources :posts do
   #     resources :comments, :scope => ":permalink/:post"
   #   end
    end
  
  # catch all
#  match.catch_all "#{RAILS_ROOT}/public/404.html", :controller => "catch_all", :action => "index"
#  match.connect ":permalink/*", :controller => "catch_all", :action => "index"
#  match.connect "*path", :controller => "catch_all", :action => "index"

end