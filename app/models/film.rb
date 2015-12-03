class Film < ActiveRecord::Base
  include PgSearch

  has_many :person_films
  has_many :people, through: :person_films
  
  def thumb_url
    "http://image.tmdb.org/t/p/w300/#{tmdb_image}"
  end

  def image_url
    "http://image.tmdb.org/t/p/w500/#{tmdb_image}"
  end

  def backdrop_url
    "http://image.tmdb.org/t/p/w1000/#{tmdb_image}"
  end

  pg_search_scope :search,
    against: [:title, :overview],
    associated_against: {people: [:name]}
end
