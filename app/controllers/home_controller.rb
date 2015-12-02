class HomeController < ApplicationController
  def index
    films = Film.order("random()").take(5)
    render "index", locals: {films: films}
  end
end