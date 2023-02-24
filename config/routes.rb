Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :lists, only: [:show, :create, :edit, :new, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  resources :movies, only: [:index, :show]
end
