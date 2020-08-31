Rails.application.routes.draw do
  resources :holidays
  resources :blurbs
  resources :moods
  resources :daily_posts
  resources :user_events
  resources :events
  resources :users, only: [:create, :index, :show]

  post '/login', to: 'auth#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
