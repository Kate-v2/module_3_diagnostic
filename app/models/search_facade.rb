
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

  # This limit is incorrect - we want 10 of certain oil type
  # and within 6 miles -- still not sure how to get this metric ....
  def get_stations(qty = 10)
    filter = {zip: @zip, limit: qty}
    EnergyService.new(filter)
  end

end
