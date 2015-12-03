class HomeController < ApplicationController
  def index
    session[:q] = params[:q] if params.key?(:q)

    films = session[:q].present? ? Film.search(session[:q]) : Film.order('random()')
    films = films.take(100)

    if params[:submit] == "Most Fresh"
      films = films.sort_by(&:freshness).reverse
    elsif params[:submit] == "Least Fresh"
      films = films.sort_by(&:freshness)
    end

    films = films.take(8)

    render "index", locals: {films: films}
  end
end