Rails.application.routes.draw do
  resources :oauth_clients
  match '/oauth/test_request',  :to => 'oauth#test_request',  :as => :test_request, via: [:get, :post]
  match '/oauth/token',         :to => 'oauth#token',         :as => :token, via: [:get, :post]
  match '/oauth/access_token',  :to => 'oauth#access_token',  :as => :access_token, via: [:get, :post]
  match '/oauth/request_token', :to => 'oauth#request_token', :as => :request_token, via: [:get, :post]
  match '/oauth/authorize',     :to => 'oauth#authorize',     :as => :authorize, via: [:get, :post]
  match '/oauth',               :to => 'oauth#index',         :as => :oauth, via: [:get, :post]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
