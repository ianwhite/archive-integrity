class AddFilms < ActiveRecord::Migration
  def up
    CornerFilmsParser.new.create_films!
  end
end
