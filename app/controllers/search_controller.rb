# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    render json: { data: SearchService.new(params[:text]).call }
  end
end
