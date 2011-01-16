TourDeFeb::Application.routes.draw do

  devise_for :users

  resources :rides
  resource :preferences, :only => [:edit, :update]

  root :to => "home#index"
end
