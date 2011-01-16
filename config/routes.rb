TourDeFeb::Application.routes.draw do

  devise_for :users

  resources :rides

  root :to => "home#index"
end
