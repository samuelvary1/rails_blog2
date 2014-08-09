Rails.application.routes.draw do
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

  root 'welcome#index'

  get "update_user" => "users#edit", :as => "update_user"

  get "users_index" => "users#index", :as => "users_index"

  get "log_out" => "sessions#destroy", :as => "log_out"

  get "log_in" => "sessions#new", :as => "log_in"

  get "sign_up" => "users#new", :as => "sign_up"

end
