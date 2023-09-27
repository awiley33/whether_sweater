class ForecastFacade
  def self.current_weather(coords)
    service = ForecastService.new
    response = service.current_weather(coords)
    CurrentForecast.new(response[:current])
  end

  def self.daily_weather(coords)
    service = ForecastService.new
    response = service.daily_weather(coords)
    response[:forecast][:forecastday].map do |forecast_data|
      DailyForecast.new(forecast_data)
    end
  end

  def self.hourly_weather(coords)
    service = ForecastService.new
    response = service.hourly_weather(coords)
    response[:forecast][:forecastday][0][:hour].map do |forecast_data|
      HourlyForecast.new(forecast_data)
    end
  end

  def self.weather_at_eta(location, day, hour)
    service = ForecastService.new
    response = service.weather_at_eta(location, day, hour)
    data = response[:forecast][:forecastday][0][:hour]
    DestinationForecast.new(datetime: data[0][:time],
                            temperature: data[0][:temp_f],
                            condition: data[0][:condition][:text])
  end
end