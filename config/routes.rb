Rails.application.routes.draw do
  resources :users
  get 'welcome/index'
    resources :users do
    resources :reminders
  end
  
    root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/deleteaccount' => 'users#destroy'
  post '/users' => 'users#create'
  put '/update' => 'users#update'
end
