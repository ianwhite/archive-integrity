class Film < ActiveRecord::Base
  acts_as_taggable

  def image_url
    "http://image.tmdb.org/t/p/w500/#{tmdb_image}"
  end

  def backdrop_url
    "http://image.tmdb.org/t/p/w1000/#{tmdb_image}"
  end
end