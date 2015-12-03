class AddFreshnessToFilms < ActiveRecord::Migration
  def change
    add_column :films, :freshness, :float
  end
end
