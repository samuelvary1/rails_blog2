Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'users/new'

  get 'users/edit'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  resources :articles do
    resources :comments
  end

  resources :users

  resources :user_sessions

  root 'welcome#index'

  get "update_user" => "users#edit", :as => "update_user"

  get "users_index" => "users#index", :as => "users_index"

  get "logout" => "user_sessions#destroy", :as => "logout"

  get "login" => "user_sessions#new", :as => "login"

  get "sign_up" => "users#new", :as => "sign_up"

end
