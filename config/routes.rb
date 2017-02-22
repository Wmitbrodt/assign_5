Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, shallow: true do

    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

end
