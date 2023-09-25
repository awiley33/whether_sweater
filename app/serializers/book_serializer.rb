class BookSerializer
  def initialize(book_results, location, current_weather)
    @book_results = book_results
    @location = location
    @current_weather = current_weather
    @total_books_found = book_results[0].quantity_found
  end

  def as_json
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": @location,
          "forecast": {
            "summary": @current_weather.condition,
            "temperature": @current_weather.temperature
          },
          "total_books_found": @total_books_found,
          "books": @book_results.map do |book|
            {
              "isbn": book.isbn,
              "title": book.title
            }
          end
        }
      }
    }
  end
end