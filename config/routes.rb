Rails.application.routes.draw do

  resources :occasions

  get 'static_pages/home'

  resources :contacts
  resources :institutions
  resources :users

  root 'static_pages#home'

  get 'sessions/new'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
 
end
