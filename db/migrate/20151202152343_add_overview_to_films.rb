class AddOverviewToFilms < ActiveRecord::Migration
  def change
    add_column :films, :overview, :text
  end
end
