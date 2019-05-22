Rails.application.routes.draw do
  root 'static_page#home'
  get  '/help'    , to: 'static_page#help'    
  get  '/about'   , to: 'static_page#about'   
  get  '/mission' , to: 'static_page#mission' 
  get  '/contact' , to: 'static_page#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
