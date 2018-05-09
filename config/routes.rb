Rails.application.routes.draw do

  #devise_for :users
  root 'welcome#home'


  resources :recipes do
    resources :ingredients
  end

  resources :recipes, only: [:index, :show] do
    resources :comments, only: [:index, :create]
  end



  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
