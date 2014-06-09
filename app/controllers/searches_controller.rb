class SearchesController < ApplicationController

  def show
    @query = params[:search][:query]
    @artists = Searcher.new(@query).results
  end
end


