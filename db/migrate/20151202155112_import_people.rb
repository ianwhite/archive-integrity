class ImportPeople < ActiveRecord::Migration
  def up
    CornerPeopleParser.new.create_people_with_films!
  end
end
