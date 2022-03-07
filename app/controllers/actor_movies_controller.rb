class ActorMoviesController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: params[:name])
    ActorMovie.create(actor_id: actor.id, movie_id: movie.id)
    redirect_to studio_movie_path(movie.studio_id, movie.id)
  end
end
