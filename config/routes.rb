Rails.application.routes.draw do

  get 'static_pages/home'
  get 'static_pages/handbook'
  get 'static_pages/manual'

  post 'contacts/search' => 'contacts#search', :as => :search_contacts
  get 'contacts/search' => 'contacts#search'

  resources :contacts
  resources :institutions
  resources :users
  resources :occasions

  root 'static_pages#home'

  get 'sessions/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
