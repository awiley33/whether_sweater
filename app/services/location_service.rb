class LocationService
  def conn
    Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.headers["key"] = Rails.application.credentials.mapquest_api_key
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_coordinates(city)
    get_url("geocoding/v1/address?key=KEY&location=#{city}")
  end
end