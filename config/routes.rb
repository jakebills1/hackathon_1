Rails.application.routes.draw do
  root "trips#index"

  get 'locations/index'
  get 'locations/show'
  get 'locations/new'
  get 'locations/edit'

  devise_for :users 
  
  resources :users, only: [:show] do 
    resources :trips, except: [:index, :show, :edit]
  end

  resources :trips, only: [:show, :index] do
    resources :locations, except: [:index, :show, :new, :edit]
  end
  
  resources :locations, only: [] do
    resources :addresses, except: [:index, :show, :new, :edit]
  end

  # create"locations/:location_id/adresses" => "addresses#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
