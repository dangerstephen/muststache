Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:show]
  resources :spaces
  resources :photos
  resources :spaces do
    resources :reservations, only: [:create]
  end
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                              :registrations => 'registrations'
                              }

  get '/your_rentals' => 'reservations#your_rentals', as: 'rentals'
  get '/your_reservations' => 'reservations#your_reservations'

  post '/notify' => 'reservations#notify'
  post '/your_rentals' => 'reservations#your_rentals'

  get '/about' => 'pages#about'

end
