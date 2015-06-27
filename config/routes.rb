Rails.application.routes.draw do
  resources :bookmarks

  root 'welcome#index'
end
