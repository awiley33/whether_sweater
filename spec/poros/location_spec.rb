require 'rails_helper'

RSpec.describe Location do
  it "exists and has attributes" do
    data = {state: "OH", city: "Cincinnati", lat: 39.10713, lon: -84.50413}
    location = Location.new(data)

    expect(location).to be_a Location
    expect(location.lat).to eq(39.10713)
    expect(location.lon).to eq(-84.50413)
    expect(location.city).to eq("Cincinnati")
    expect(location.state).to eq("OH")
  end
end