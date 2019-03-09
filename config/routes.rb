Rails.application.routes.draw do
  root "trips#index"

  devise_for :users 
  
  resources :users, only: [:show] do 
    resources :trips, except: [:index, :show, :edit]
  end

  resources :trips, only: [:show, :index, :create, :edit, :update] do
    resources :locations, except: [:index, :show]
  end
  
  resources :locations, only: [] do
    resources :addresses, except: [:index, :show]
  end

  # create"locations/:location_id/adresses" => "addresses#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
