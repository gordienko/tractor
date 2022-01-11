Rails.application.routes.draw do
  namespace :admin do
    root "tractor#dash"
    get 'dash', to: 'tractor#dash'
    resources :medias
    resources :pages
    resources :articles
    resources :userforms
    resources :menus

  end
  resources :articles, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "articles#index"

end
