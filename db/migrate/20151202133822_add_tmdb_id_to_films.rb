class AddTmdbIdToFilms < ActiveRecord::Migration
  def change
    add_column :films, :tmdb_id, :string
  end
end
