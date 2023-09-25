class LocationFacade
  def self.get_coordinates(search)
    service = LocationService.new
    response = service.get_coordinates(search)
    Location.new(city: response[:results][0][:locations][0][:adminArea5],
                state: response[:results][0][:locations][0][:adminArea3],
                lat: response[:results][0][:locations][0][:latLng][:lat],
                lon: response[:results][0][:locations][0][:latLng][:lng]
                )
  end
end