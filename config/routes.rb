Rails.application.routes.draw do
  resources :trains do
    resources :cars, shallow: true
  end
  resources :railway_stations

  resources :routes do
    resources :railway_stations_routes
  end




  resources :tickets

  get 'welcome/index'

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
