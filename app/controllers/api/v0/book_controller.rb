class Api::V0::BookController < ApplicationController
  def index
    response = BookFacade.get_books(params[:location], params[:quantity])
    
    current_weather = ForecastFacade.current_weather(coords)
    daily_weather = ForecastFacade.daily_weather(coords)
    hourly_weather = ForecastFacade.hourly_weather(coords)
    render json: ForecastSerializer.new(current_weather, daily_weather, hourly_weather).as_json
  end
end