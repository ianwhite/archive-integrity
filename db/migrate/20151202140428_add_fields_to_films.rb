class AddFieldsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :popularity, :float
    add_column :films, :vote_average, :float
    add_column :films, :vote_count, :integer
  end
end
