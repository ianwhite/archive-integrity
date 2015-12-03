class Film < ActiveRecord::Base
  include PgSearch

  has_many :person_films
  has_many :people, through: :person_films
  has_many :interactions
  
  def thumb_url
    "http://image.tmdb.org/t/p/w300/#{tmdb_image}"
  end

  def image_url
    "http://image.tmdb.org/t/p/w600/#{tmdb_image}"
  end

  def backdrop_url
    "http://image.tmdb.org/t/p/w1000/#{tmdb_image}"
  end

  pg_search_scope :search,
    against: [:title, :overview],
    associated_against: {people: [:name]}

  def base_freshness
    popl = [2, popularity].min
    score = (popl * 5) + (age * 2)
    score / 12
  end

  def age
    ((year || 1970) - 1915).to_f / 100
  end

  def freshness
    [1, base_freshness + (interactions.count * 0.1)].min
  end
end
