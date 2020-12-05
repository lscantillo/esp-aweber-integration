Rails.application.routes.draw do
  root 'subscribe#index'
   # Api Versions Routes
  # Api V1 ../api/v1/..

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post 'new_lead' => 'subscribe#new_lead'
    end

  end
  
end
