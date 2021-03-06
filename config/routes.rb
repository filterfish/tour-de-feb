TourDeFeb::Application.routes.draw do

  devise_for :users

  resources :rides

  resource :preferences, :only => [:edit, :update]

  match '/groups/:name' => 'groups#index'
  match '/index' => 'home#index'

  root :to => "home#index"
end
