class InteractionsController < ApplicationController
  def create
    film = Film.find(params[:film_id])
    Interaction.create!(user: current_user, film: film, interaction_type: :seen, value: 1)
    redirect_to :back
  end
end