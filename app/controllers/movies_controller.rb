# frozen_string_literal: true

class MoviesController < ApplicationController

  def movies
    render json: { data: all_movies }
  end

  private

  def all_movies
    Movie.all
  end
end
