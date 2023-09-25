class ForecastService
  def conn
    Faraday.new(url: "http://api.weatherapi.com") do |faraday|
      faraday.headers["key"] = Rails.application.credentials.weather_api_key
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def current_weather(coords)
    get_url("v1/current.json?q=#{coords}&aqi=no")
  end

  def daily_weather(coords)
    get_url("v1/forecast.json?q=#{coords}&days=5&aqi=yes&alerts=no")
  end

  def hourly_weather(coords)
    get_url("v1/forecast.json?q=#{coords}&days=1&aqi=yes&alerts=no&hours=24")
  end
end