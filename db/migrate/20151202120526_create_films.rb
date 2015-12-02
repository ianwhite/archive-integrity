class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.integer :year
      t.float :freshness
      t.string :director
      t.string :country
      t.string :certificate
      t.string :image_uid
    end
  end
end
