Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      delete 'delate'
    end
  end
  resources :cart_items

  
  #get "/top/delate"
 # post '/delate', to: 'top#delate', as: 'delate'
 
  post '/top/add', to: 'top#add', as: 'add'
  get '/top/add', to: 'top#add'
  
  get '/show',to: 'top#show',as: 'show'
  post'top/show',to: 'top#show'
  
  get '/new',to: 'top#new',as: 'new'
  post '/new',to: 'top#new'
  
  get 'top/index',to: 'top#index',as: 'index'
  post 'top/index',to: 'top#index'
  
  get '/main',to: 'top#main'
  root 'top#main'
  # Defines the root path route ("/")
  # root "articles#index"
end
