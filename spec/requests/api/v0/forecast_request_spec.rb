require 'rails_helper'

RSpec.describe "Forecast Service", :vcr do
  describe "happy path" do
    it "can get current weather" do
      get "/api/v0/forecast?location=cincinatti,oh"
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data][:attributes]).to have_key(:current_weather)
      expect(parsed_response[:data][:attributes][:current_weather]).to be_a Hash

      current_weather = parsed_response[:data][:attributes][:current_weather]

      expect(current_weather).to have_key(:last_updated)
      expect(current_weather[:last_updated]).to be_a String

      expect(current_weather).to have_key(:temperature)
      expect(current_weather[:temperature]).to be_a Float

      expect(current_weather).to have_key(:feels_like)
      expect(current_weather[:feels_like]).to be_a Float

      expect(current_weather).to have_key(:humidity)
      expect(current_weather[:humidity]).to be_an Integer

      expect(current_weather).to have_key(:uvi)
      expect(current_weather[:uvi]).to be_a Float

      expect(current_weather).to have_key(:visibility)
      expect(current_weather[:visibility]).to be_a Float

      expect(current_weather).to have_key(:condition)
      expect(current_weather[:condition]).to be_a String

      expect(current_weather).to have_key(:icon)
      expect(current_weather[:icon]).to be_a String

      expect(current_weather.count).to eq(8)
    end
    
    it "can get daily weather" do
      get "/api/v0/forecast?location=cincinatti,oh"
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
  
      expect(parsed_response[:data][:attributes]).to have_key(:daily_weather)
      expect(parsed_response[:data][:attributes][:daily_weather]).to be_an Array
      daily_weather = parsed_response[:data][:attributes][:daily_weather]
      expect(daily_weather.count).to eq(5)
      
      expect(daily_weather[0]).to have_key(:date)
      expect(daily_weather[0][:date]).to be_a String
      
      expect(daily_weather[0]).to have_key(:sunrise)
      expect(daily_weather[0][:sunrise]).to be_a String
      
      expect(daily_weather[0]).to have_key(:sunset)
      expect(daily_weather[0][:sunset]).to be_a String
      
      expect(daily_weather[0]).to have_key(:max_temp)
      expect(daily_weather[0][:max_temp]).to be_a Float
      
      expect(daily_weather[0]).to have_key(:min_temp)
      expect(daily_weather[0][:min_temp]).to be_a Float
      
      expect(daily_weather[0]).to have_key(:condition)
      expect(daily_weather[0][:condition]).to be_a String
      
      expect(daily_weather[0]).to have_key(:icon)
      expect(daily_weather[0][:icon]).to be_a String
      
      expect(daily_weather[0].count).to eq(7)
      expect(daily_weather[0]).to_not have_key(:maxwind_mph)
      expect(daily_weather[0]).to_not have_key(:avgtemp_f)
      expect(daily_weather[0]).to_not have_key(:moon_phase)
    end
    
    it "can get hourly weather" do
      get "/api/v0/forecast?location=cincinatti,oh"
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
  
      expect(parsed_response[:data][:attributes]).to have_key(:hourly_weather)
      expect(parsed_response[:data][:attributes][:hourly_weather]).to be_an Array
      hourly_weather = parsed_response[:data][:attributes][:hourly_weather]
      expect(hourly_weather.count).to eq(24)

      expect(hourly_weather[0]).to have_key(:time)
      expect(hourly_weather[0][:time]).to be_a String

      expect(hourly_weather[0]).to have_key(:temperature)
      expect(hourly_weather[0][:temperature]).to be_a Float

      expect(hourly_weather[0]).to have_key(:conditions)
      expect(hourly_weather[0][:conditions]).to be_a String

      expect(hourly_weather[0]).to have_key(:icon)
      expect(hourly_weather[0][:icon]).to be_a String

      expect(hourly_weather[0].count).to eq(4)
      expect(hourly_weather[0]).to_not have_key(:windchill_f)
      expect(hourly_weather[0]).to_not have_key(:humidity)
      expect(hourly_weather[0]).to_not have_key(:feels_like)
    end
  end
end