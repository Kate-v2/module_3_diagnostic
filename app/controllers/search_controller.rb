
class WelcomeController < ApplicationController

  def index
    @search = SearchFacade.new()
  end

end
