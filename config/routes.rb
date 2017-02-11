Rails.application.routes.draw do

  get '/' => 'blog#index'

  get '/show' => 'blog#show'

  get '/about' => 'blog#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
