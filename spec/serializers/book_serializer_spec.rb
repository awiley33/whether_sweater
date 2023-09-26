require 'rails_helper'

RSpec.describe BookSerializer, :vcr do
  it "formats the endpoint response" do
    location = "chicago,il"
    book_results = BookFacade.get_books(location, 10)
    response = LocationFacade.get_coordinates(location)
    coords = "#{response.lat},#{response.lon}"
    current_weather = ForecastFacade.current_weather(coords)

    results = BookSerializer.new(book_results, location, current_weather).as_json
    expect(results).to eq(
      {:data=>
        {:id=>"null",
          :type=>"books",
          :attributes=>
          {:destination=>"chicago,il",
            :forecast=>{:summary=>"Partly cloudy", :temperature=>70.0},
            :total_books_found=>694,
            :books=>
              [{:isbn=>["0762553464", "9780762553464"], :title=>"Chicago Il/Vicinity"},
              {:isbn=>["9780841692633", "0841692637"], :title=>"Chicago, Il Map"},
              {:isbn=>["9780762521920", "0762521929"], :title=>"Chicago, Il Vicinity"},
              {:isbn=>["9780738533421", "0738533424"], :title=>"Chicago Skyscrapers (IL)"},
              {:isbn=>["0738533688", "9780738533681"], :title=>"Puerto Rican Chicago (IL)"},
              {:isbn=>["0841693625", "9780841693623"], :title=>"Chicago, Il Street Guide"},
              {:isbn=>["9780841693319", "0841693315"], :title=>"Chicago Loop, Il Map"},
              {:isbn=>["0841693285", "9780841693289"], :title=>"Chicago & Vicinity, Il Slicker"},
              {:isbn=>["9780752413174", "0752413171"], :title=>"Italians in Chicago   (IL)"},
              {:isbn=>["0738503452", "9780738503455"], :title=>"Chicago's South Shore (IL)"}]}}}
          )
  end
end