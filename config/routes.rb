Rails.application.routes.draw do

  

  get 'static_pages/home'

  resources :contacts
  resources :institutions
  resources :users
  resources :occasions
  resources :handbook

  root 'static_pages#home'

  get 'sessions/new'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
 
end
