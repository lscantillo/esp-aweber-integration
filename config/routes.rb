Rails.application.routes.draw do

  require 'sidekiq/web'
  #require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root 'users#index'
   # Api Versions Routes
  # Api V1 ../api/v1/..
  resources :users, only: [:new, :create, :show] , :path => 'leads'
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post 'new_lead' => 'users#new_lead'
    end

  end
  
end
