class Api::V0::RoadTripsController < ApplicationController
  def create
    if current_user && (current_user.api_key == params[:api_key])
      road_trip = RoadTripFacade.get_directions(params[:origin], params[:destination])
      destination_forecast = ForecastFacade.weather_at_eta(params[:destination], road_trip.eta_day, road_trip.eta_hour)
      render json: RoadTripSerializer.new(road_trip, destination_forecast).as_json
    else
      render json: { error: 'Invalid or Missing API Key' }, status: 401
    end
  end
end