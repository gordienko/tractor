Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root "site#dash"
    get 'dash', to: 'site#dash'
    get 'activity', to: 'site#activity'
    get 'settings', to: 'site#settings'
    get 'homepage', to: 'site#homepage'
    resources :site, only: [:update]
    resources :medias
    resources :pages
    resources :articles
    resources :userforms
    resources :menus
    resources :users

  end
  resources :articles, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "articles#index"

end
