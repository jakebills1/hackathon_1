Rails.application.routes.draw do

  devise_for :users 
  
  resources :users, only: [:show] do 
    resources :trips, except: [:index, :show, :new, :edit]
  end

  resources :trips, only: [:show] do
    resources :locations, except: [:index, :show, :new, :edit] do
      resources :addresses, except: [:index, :show, :new, :edit]
    end
  end

  # create"locations/:location_id/adresses" => "addresses#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
