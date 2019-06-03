Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_page#home'
  get  '/help'    , to: 'static_page#help'    
  get  '/about'   , to: 'static_page#about'   
  get  '/mission' , to: 'static_page#mission' 
  get  '/contact' , to: 'static_page#contact'
  get  '/logo'    , to: 'static_page#logo'

  resources :users
  get  '/signup'  , to: 'users#new'
  post '/signup'  , to: 'users#create'

  get  '/login'   , to: 'sessions#new'
  post '/login'   , to: 'sessions#create'
  delete  '/logout'  , to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
