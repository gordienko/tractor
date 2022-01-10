Rails.application.routes.draw do
  namespace :admin do
    root "tractor#dash"
    get 'dash', to: 'tractor#dash'

    resources :articles
    resources :medias
  end
  resources :articles, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "articles#index"

end
