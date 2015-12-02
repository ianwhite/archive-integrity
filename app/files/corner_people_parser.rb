require 'csv'

class CornerPeopleParser
  attr_reader :people, :person_films

  def initialize(people: "app/files/corner/people.csv", person_films: "app/files/corner/person_films.csv")
    @people = CSV.read(people, headers: true)
    @person_films = CSV.read(person_films, headers: true)
  end

  def create_people_with_films!
    people.each do |row|
      person = Person.create!(
        tmdb_id: row['tmdb_person_id'],
        name: row['name'],
        tmdb_image: row['profile_path']
      )
    end

    person_films.each do |row|
      p = Person.find_by(tmdb_id: row['tmdb_person_id'])
      f = Film.find_by(tmdb_id: row['tmdb_film_id'])

      if p && f
        PersonFilm.create!(person: p, film: f)
      else
        puts "couldn't create person/film rel for #{row}"
      end
    end
  end
end