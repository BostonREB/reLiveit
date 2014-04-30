Relive::Application.routes.draw do

  root 'homes#show'

  resources :users, only: [:show]

  resources :artists, only: [:show] do
    member do
      post "follow" => "following_artist_relationships#create"
      delete "unfollow" => "following_artist_relationships#destroy"
    end
  end

end
