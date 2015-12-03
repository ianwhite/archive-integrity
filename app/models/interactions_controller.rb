class InteractionsController < ApplicationController
  def create
    film = Film.find(params[:film_id])
    Interaction.create!(user: current_user, film: film, interaction_type: :seen, value: 1)
    film.update_attributes!(freshness: film.calculate_freshness)
    redirect_to :back
  end
end