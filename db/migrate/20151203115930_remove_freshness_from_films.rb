class RemoveFreshnessFromFilms < ActiveRecord::Migration
  def change
    remove_column :films, :freshness, :integer
  end
end
