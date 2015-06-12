Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  #root 'notes#index'
  resources :notes

end
