class RoadTripService
  def conn
    Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.headers["key"] = Rails.application.credentials.mapquest_api_key
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_directions(origin, destination)
    get_url("directions/v2/route?from=#{origin}h&to=#{destination}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
  end

end