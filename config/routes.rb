Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get 'users/show' => 'users#show'
  get 'users/edit' => 'users#edit'
  post 'users/edit' => 'users#update'

  get 'users/pins' => 'users#pins'
  get 'pins/new' => 'pins#new'
  post 'pins/new' => 'pins#create'
  get 'pins/:id' => 'pins#show'

  get 'users/boards' => 'users#boards'
  get 'boards/new' => 'boards#new'
  post 'boards/new' => 'boards#create'
  get 'boards/new2' => 'boards#new2'
  post 'boards/new2' => 'boards#create2'
  get 'boards/:id' => 'boards#show'

  get 'pins/:id/add_to_board' => 'boards#list'
  post 'pins/:id/:board_id' => 'groups#create'
end
