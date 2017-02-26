Rails.application.routes.draw do

  root 'posts#index'

  resources :categories

  resources :posts, shallow: true do

    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update] do
    get :edit_password, on: :member
    patch :update_password, on: :member
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :admin do
    resources :dashboard, only: [:index]
  end


end
