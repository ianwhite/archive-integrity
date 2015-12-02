require 'csv'

class CornerFilmsParser
  attr_reader :data

  def initialize(file = "app/files/corner/films.csv")
    @data = CSV.read(file, headers: true)
  end

  def create_films!
    data.each do |row|
      if row['poster_path'].present? && row['tmdb_film_id'].present? && row['imdb_id'].present?
        Film.create!(
          corner_event_id: row['corner_event_id'],
          tmdb_id: row['tmdb_film_id'],
          title: row['title'],
          tmdb_backdrop: row['backdrop_path'],
          imdb_id: row['imdb_id'].sub('tt',''),
          popularity: row['popularity'],
          tmdb_image: row['poster_path'],
          year: parse_year(row['release_date'])
        )
      end
    end
  end

  def parse_year(date)
    if date.present?
      y = Date.strptime(date,'%m/%d/%Y').year
      y += 2000 if y < 100
      y -= 100 if y > Time.now.year
      y
    end
  end
end