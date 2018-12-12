
# PORO

class EnergyService

  def initialize(filter)
    @filter = filter
    @base_url = 'https://developer.nrel.gov/api/alt-fuel-stations/v1.json'
  end

  def get_stations
    url = "?#{zip}&#{limit}"
    get_json(url)
  end

  private

  def zip
    "zip=#{@filter[:zip]}"
  end

  def limit
    "limit=#{@filter[:limit]}"
  end

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
