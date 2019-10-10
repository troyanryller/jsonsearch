# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    result = SearchService.new(params[:text]).call

    render json: { data: result }
  end
end
