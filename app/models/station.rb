
# PORO

class Station

  def initialize(filter)
    @filter = filter
  end

  def name
    @filter[:station_name]
  end

  def address
    "#{street}, #{city}, #{state} #{zip}"
  end

  def fuel
    code = @filter[:fuel_type_code]
    code unless fuel_types[code.to_sym]
  end


  private

  def street
    @filter[:street_address]
  end

  def city
    @filter[:city]
  end

  def state
    @filter[:state]
  end

  def zip
    @filter[:zip]
  end

  # def country
  #   @filter[:country]
  # end

  def fuel_types
    {
      # BD:   "",
      # E85:  "",
      ELEC: "Electric",
      HY:   "Hydrogren" #,
      # LNG:  "",
      # CNG:  "",
      # LPG:  ""
    }
  end

end
