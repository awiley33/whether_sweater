class Api::V0::BookController < ApplicationController
  def index
    book_results = BookFacade.get_books(params[:location], params[:quantity])
    response = LocationFacade.get_coordinates(params[:location])
    coords = "#{response.lat},#{response.lon}"
    current_weather = ForecastFacade.current_weather(coords)
    render json: BookSerializer.new(book_results, params[:location], current_weather).as_json
  end
end