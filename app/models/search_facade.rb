
# PORO

class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    make_stations
    # .sort_by()  # DISTANCE from WHERE??, what metric is "distance"
  end

  def make_stations
    get_stations.map{ |station| Station.new(station) }
  end


  private

  def get_stations(qty = 10)
    filter = {zip: @zip, limit: qty}
    EnergyService.new(filter)
  end

end
