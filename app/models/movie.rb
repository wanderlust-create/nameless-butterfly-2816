class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

    def all_actors
      self.actors.order(:age)
    end

    def average_actor_age
      all_actors.average('age').round
    end
end
