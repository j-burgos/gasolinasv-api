Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :gas_types, path: '/gas-types', param: :identifier  do
        resources :prices, :only => ['index'] do
          get 'latest', on: :collection
        end
      end
      resources :zones, param: :identifier do
        resources :prices, :only => ['index'] do
          get 'latest', on: :collection
        end
      end
      resources :prices do
        get 'latest', on: :collection
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
