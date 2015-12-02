class CreatePersonFilms < ActiveRecord::Migration
  def change
    create_table :person_films do |t|
      t.references :film, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
    end
  end
end
