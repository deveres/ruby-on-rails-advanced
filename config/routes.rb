Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes do
    resources :railway_stations_routes
  end


  resources :cars
  resources :tickets

  get 'welcome/index'

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
