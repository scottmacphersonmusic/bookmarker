Rails.application.routes.draw do
  resources :bookmarks

  root 'bookmarks#index'

  get 'autotitle/:new', to: 'autotitle#new'
end
