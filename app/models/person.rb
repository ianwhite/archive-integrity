class Person < ActiveRecord::Base
  has_many :person_films
  has_many :films, through: :person_films
  
  def image_url
    "http://image.tmdb.org/t/p/w500/#{tmdb_image}"
  end
end