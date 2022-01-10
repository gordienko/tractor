Rails.application.routes.draw do
  namespace :admin do
    root "tractor#dash"
    get 'dash', to: 'tractor#dash'

    resources :articles
  end
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "articles#index"

end
