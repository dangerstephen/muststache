Rails.application.routes.draw do

  root 'pages#home'

  get 'pages/home'

  devise_for :users
end
