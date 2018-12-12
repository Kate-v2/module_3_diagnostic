
# PORO

class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    make_stations

    # API results are already returned in min-to-max distance
    # is it okay to trust this ?
  end



  private


  def make_stations
    get_station_data.map{ |station| Station.new(station) if within_distance?(station) }
  end

  def within_distance(filter)
    filter[:distance].to_i <= 6 # miles
  end

  # IGNORE - This limit is incorrect - we want 10 of certain oil type and within 6 miles
  # ACTUALLY - first 10 should be under 6 OR there are not 10 that are under 6 miles
  def get_station_data(qty = 10)
    filter = { zip: @zip, limit: qty}
    EnergyService.new(filter).get_stations
  end

end
