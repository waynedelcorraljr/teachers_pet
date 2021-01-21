Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    resources :courses, :students, only: [:new, :create]
  end
  resources :students do
    resources :courses
  end
  resources :courses do
    resources :lessons
  end
  resources :lessons
  resources :sessions, only: [:new, :create]
  get '/signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
