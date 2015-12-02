class Film < ActiveRecord::Base
  has_many :person_films
  has_many :people, through: :person_films
  
  def image_url
    "http://image.tmdb.org/t/p/w500/#{tmdb_image}"
  end

  def backdrop_url
    "http://image.tmdb.org/t/p/w1000/#{tmdb_image}"
  end
end