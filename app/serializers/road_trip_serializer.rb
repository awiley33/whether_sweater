class RoadTripSerializer
  def initialize(road_trip, destination_forecast)
    @road_trip = road_trip
    @destination_forecast = destination_forecast
  end

  def as_json
        {
        "data": {
            "id": "null",
            "type": "road_trip",
            "attributes": {
                "start_city": @road_trip.start_city,
                "end_city": @road_trip.end_city,
                "travel_time": @road_trip.travel_time,
                "weather_at_eta": {
                    "datetime": @destination_forecast.datetime,
                    "temperature": @destination_forecast.temperature,
                    "condition": @destination_forecast.condition
                }
            }
        }
    }
  end
end