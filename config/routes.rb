Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :spaces
  resources :photos
  resources :spaces do
    resources :reservations, only: [:create]
  end

  root 'pages#home'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

end
