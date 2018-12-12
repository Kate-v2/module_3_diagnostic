
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

  def distance
    "?????" # unless ????
  end

  def access
    @filter[:access_days_time]
  end




  private

  def street() @filter[:street_address] end
  def city()   @filter[:city]           end
  def state()  @filter[:state]          end
  def zip()    @filter[:zip]            end

  # def country
  #   @filter[:country]
  # end

  def fuel_types
    {
      BD:   "Biodiesel (B20 and above)",
      E85:  "Ethanol (E85)",
      ELEC: "Electric",
      HY:   "Hydrogren",
      LNG:  "Liquefied Natural Gas",
      CNG:  "Compressed Natural Gas",
      LPG:  "Liquefied Petroleum Gas (Propane)"
    }
  end

end
