# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :valid_order_param, only: :movies_order_by

  def movies
    render json: { data: all_movies }
  end

  def movies_order_by
    render json: { data: ordered_movies }
  end

  private

  def ordered_movies
    if param_order.include?("desc")
      param = param_order.delete_suffix('_desc')
      all_movies.order(param).reverse
    else
      all_movies.order(param_order)
    end
  end

  def valid_order_param
    return render json: {
      error_description: "Ups! No puedo ordenar por #{param_order} por favor
      intenta con #{possible_order}"
    } unless possible_order.flatten.include?(param_order)
  end

  def possible_order
    column_name = Movie.columns.map { |column| column.name }
    column_desc = column_name.map { |column| column + '_desc' }
    column_name.push(column_desc)
  end

  def all_movies
    Movie.all
  end

  def param_order
    params[:order].downcase
  end
end

