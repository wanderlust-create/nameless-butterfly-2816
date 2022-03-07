class Studio < ApplicationRecord
  has_many :movies

  def all_movies
    self.movies
  end
end
