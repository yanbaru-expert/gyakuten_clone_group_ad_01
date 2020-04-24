class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(id: "ASC").page(params[:page]).per(10)
  end

end
