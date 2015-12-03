class HomeController < ApplicationController
  def index
    session[:q] = params[:q] if params.key?(:q)

    films = session[:q].present? ? Film.search(session[:q]).take(4) : Film.order('random()').take(4)

    render "index", locals: {films: films}
  end
end