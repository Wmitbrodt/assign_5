Rails.application.routes.draw do

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  get 'likes/create'

  get 'likes/destroy'

  root 'posts#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:show, :index, :create]
    end
  end

  resources :categories

  resources :posts, shallow: true do

    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update] do
    get :edit_password, on: :member
    patch :update_password, on: :member
    resources :likes, only: [:index]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :admin do
    resources :dashboard, only: [:index]
  end


end
