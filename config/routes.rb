Rails.application.routes.draw do
  
  
  get 'welcome/index'

  
   resources :articles do
  resources :comments
  

end

  get 'sessions/new'
  get 'users/new'
  get  '/home', to: 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/dashboard', to: 'static_pages#dashboard'

	root 'static_pages#home'
	get  '/signup',  to: 'users#new'
	post '/signup',  to: 'users#create'
   get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/email', to: 'contacts#new'

  match '/contacts',     to: 'contacts#new',           via: 'get'
  resources "contacts", only: [:new, :create]
	resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
