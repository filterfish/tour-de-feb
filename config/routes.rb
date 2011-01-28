TourDeFeb::Application.routes.draw do

  devise_for :users

  resources :rides
  match '/groups/:name' => 'groups#index'
  resource :preferences, :only => [:edit, :update]

  match '/index' => 'home#index'

  root :to => "home#index"
end
