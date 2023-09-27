class RoadTripFacade
  def self.get_directions(origin, destination)
    service = RoadTripService.new
    response = service.get_directions(origin, destination)

    RoadTrip.new(start_city: origin,
                end_city: destination,
                travel_time: response[:route][:formattedTime],
                unix_time: response[:route][:time])
  end
end