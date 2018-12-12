
# PORO

class EnergyService

  # Docs
  # https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/

  def initialize(filter)
    @filter = filter
    @base_url = 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json'
  end

  def get_stations
    url = "?#{location}&#{zip}&#{fuel_types}&#{limit}"
    get_json(url)
  end
  

  private

  # --- filters ---

  def location
    "location=#{@filter[:zip]}"
  end

  # perhaps we don't need this anymore because of
  # location which is *required* ?
  def zip
    "zip=#{@filter[:zip]}"
  end

  def limit
    "limit=#{@filter[:limit]}"
  end

  def fuel_types
    # A single fuel type, or a comma-separated list of multiple fuel types, may be given.
    propane  = 'LPG'; electric = 'ELC'
    "fuel_type=#{propane},#{electric}"
  end


  # --- API call ---

  def get_json(url)
    response = search_connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_connection
    Faraday.new(url: @base_url) do |f|
      f.headers['X-Api-Key'] = ENV["EnergyToken"]
      f.adapter Faraday.default_adapter
    end
  end

end
