require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  describe "class methods" do
    it "#current_weather" do
      current_forecast = ForecastFacade.current_weather("39.10713,-84.50413")
      expect(current_forecast).to be_a CurrentForecast
    end

    it "#daily_weather" do
      daily_forecasts = ForecastFacade.daily_weather("39.10713,-84.50413")
      daily_forecasts.each do |daily_forecast|
        expect(daily_forecast).to be_a DailyForecast
      end
    end

    it "#hourly_weather" do
      hourly_forecasts = ForecastFacade.hourly_weather("39.10713,-84.50413")
      hourly_forecasts.each do |hourly_forecast|
        expect(hourly_forecast).to be_a HourlyForecast
      end
    end
  end
end
