Rails.application.routes.draw do
  get 'sessions/new' # das haben wir jetzt zweimal! wo kommt das denn her? unteres ist aus dem tutorial... aber das hier?

  get 'users/new'

  resources :contacts

  root 'contacts#index'
  
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
 
end
