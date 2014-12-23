Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: %i(new create)
  end

  devise_for :users
  root to: 'articles#index'
end
