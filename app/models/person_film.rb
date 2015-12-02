class PersonFilm < ActiveRecord::Base
  belongs_to :film, required: true
  belongs_to :person, required: true
end