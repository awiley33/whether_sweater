class LocationService
  def conn
    Faraday.new(url: "https://openlibrary.org")
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_books(location, quantity)
    get_url("search.json?q=#{location.gsub(",", "+")}&limit=#{quantity}")
  end
end