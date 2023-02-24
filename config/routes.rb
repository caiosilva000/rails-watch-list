Rails.application.routes.draw do
  root to: "lists#index"
  resources :articles  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:show, :create, :edit, :new, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  resources :movies, only: [:index, :show]
end
