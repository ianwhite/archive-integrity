class AddCornerEventIdToFilms < ActiveRecord::Migration
  def change
    add_column :films, :corner_event_id, :string
  end
end
