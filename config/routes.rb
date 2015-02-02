Splurty::Application.routes.draw do

  root 'categories#index'
  
  resources :categories do
    resources :quotes
  end
  
  get 'about', :to => 'quotes#about'
end
