class UpdateFreshness < ActiveRecord::Migration
  def change
    Film.all.each do |film|
      film.freshness = film.calculate_freshness
      film.save
    end
  end
end
