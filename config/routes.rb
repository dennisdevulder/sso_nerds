# frozen_string_literal: true

Rails.application.routes.draw do
  resources :oauth_clients
  match '/oauth/test_request',  via: [:get], to: 'oauth#test_request',     as: :test_request
  match '/oauth/token',         via: [:post], to: 'oauth#token',           as: :token
  match '/oauth/access_token',  via: [:get], to: 'oauth#access_token',     as: :access_token
  match '/oauth/request_token', via: [:get], to: 'oauth#request_token',    as: :request_token
  match '/oauth/authorize',     via: %i[get post], to: 'oauth#authorize', as: :authorize
  match '/oauth',               via: [:get], to: 'oauth#index', as: :oauth
  devise_for :users

  namespace :api do
    namespace :v1 do
      get 'data' => 'data#show'
    end
  end

  root to: 'oauth_clients#index'
end
