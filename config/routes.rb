Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'orders/edit'
  # get 'foods/index'
  # get 'foods/show'
  # get 'foods/new'
  # get 'foods/edit'
  # get 'trucks/index'
  # get 'trucks/show'
  # get 'trucks/new'
  # get 'trucks/edit'

  root 'home#index'

  # These routes are used as the sessions controller
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy' , as: :log_out
  get '/about' => 'home#about'

  resources :users do
    get '/myorders' => 'users#my_order'
    # resources :orders
  end
 

  resources :trucks do 
    resources :orders
    resources :foods
  end
end
