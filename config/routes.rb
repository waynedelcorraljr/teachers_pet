Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    resources :courses
  end
  resources :students
  resources :courses do
    resources :lessons
  end
  resources :lessons
  resources :sessions, only: [:new, :create]
  get '/signin', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'
end
