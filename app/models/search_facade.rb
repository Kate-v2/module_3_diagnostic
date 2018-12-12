
# PORO

class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    get_stations
    # .sort_by()  # DISTANCE from WHERE??, what metric is "distance"
  end


  private

  def get_stations(qty = 10)
    filter = {zip: @zip, limit: qty}
    EnergyService.new(filter)
  end

end
