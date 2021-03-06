Relive::Application.routes.draw do

  root 'homes#show'

  resources :users, only: [:show, :edit, :update]

  resources :artists, only: [:index, :show] do
    member do
      post "follow" => "following_artist_relationships#create"
      delete "unfollow" => "following_artist_relationships#destroy"
    end
  end

  resource :search, only: [:show]

end
