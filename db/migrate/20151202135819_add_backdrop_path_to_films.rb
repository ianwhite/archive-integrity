class AddBackdropPathToFilms < ActiveRecord::Migration
  def change
    add_column :films, :tmdb_backdrop, :string
  end
end
