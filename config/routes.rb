Rails.application.routes.draw do
  devise_for :users
  root 'home#index' 
  resources :losts
  resources :founds
  resources :categories


  

end
