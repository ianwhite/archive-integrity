class FilmsController < ApplicationController
  def show
    film = Film.find(params[:id])
    render "show", locals: {film: film}
  end
end