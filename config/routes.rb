Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:show]
  resources :spaces
  resources :photos
  resources :spaces do
    resources :reservations, only: [:create]
  end
  resources :conversations do
    resources :messages
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  get '/your_rentals' => 'reservations#your_rentals', as: 'rentals'
  get '/your_reservations' => 'reservations#your_reservations'

  post '/notify' => 'reservations#notify'
  post '/your_rentals' => 'reservations#your_rentals'

end
