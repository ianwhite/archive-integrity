class AddImdbIdToFilms < ActiveRecord::Migration
  def change
    add_column :films, :imdb_id, :string
  end
end
