require "search_facade"

class SearchController < ApplicationController

  def index
    zip = params[:q]
    @search = SearchFacade.new(zip)
  end

end
