Rails.application.routes.draw do
  resources :bookmarks

  root 'bookmarks#index'

  post 'autotitle/:create', to: 'autotitle#create', as: :autotitle
end
