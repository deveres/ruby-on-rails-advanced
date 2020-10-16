Rails.application.routes.draw do
  devise_for :users

  resource :search, only: [:show]

  resources :tickets, only: [:index, :show, :destroy]
  resources :trains, only: [] do
    resources :tickets, only: [:new, :create], shallow: true
  end

  namespace :admin do
    get '', to: 'main#index', as: '/'

    resources :tickets, only: [:index, :show, :edit, :update, :destroy]

    resources :trains do
      resources :cars, shallow: true
    end

    resources :railway_stations do
      patch :update_params, on: :member

    end
    delete 'delete_from_route/:id/:route_id', to: 'railway_stations#delete_from_route', as: :delete_from_route


    resources :routes do
      post :add_station_to, on: :member
    end
  end

  get 'welcome/index'

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
