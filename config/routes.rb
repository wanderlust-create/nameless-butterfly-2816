Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :studios, only: [:index] do
      resources :movies, only: [:show]
    end
    # resources :actor_movies, only: [:index, :new, :create]
    post '/studios/:studio_id/movies/:id' , to: 'actor_movies#create'
end
