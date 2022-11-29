Rails.application.routes.draw do
  resources :users
  resource :session, only: %i[new create destroy]
  get 'users/show', as: :all
  get 'home/input'
  get 'home/result', as: :res
  root 'sessions#new'
end
