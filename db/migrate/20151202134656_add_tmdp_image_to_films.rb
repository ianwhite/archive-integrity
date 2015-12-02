class AddTmdpImageToFilms < ActiveRecord::Migration
  def change
    add_column :films, :tmdb_image, :string
  end
end
