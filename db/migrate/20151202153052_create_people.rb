class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :tmdb_id
      t.string :name
      t.string :tmdb_image
    end
  end
end
