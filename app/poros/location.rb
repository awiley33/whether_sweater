class Location
  attr_reader :lat,
              :lon,
              :city,
              :state
  def initialize(data)
    @city = data[:city]
    @state = data[:state]
    @lat = data[:lat]
    @lon = data[:lon]
  end
end