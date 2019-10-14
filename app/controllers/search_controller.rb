# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    result = SearchService.new(text: params[:text], source: DataQuery).call

    render json: { data: result }
  end
end
