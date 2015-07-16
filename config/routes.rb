Rails.application.routes.draw do
  resources :bookmarks

  post 'autotitle/create', to: 'autotitle#create'

  root 'bookmarks#index'
end
