require 'rails_helper'

RSpec.describe CurrentForecast do
  it "exists and has attributes" do
    attrs = {:last_updated_epoch=>1695613500,
    :last_updated=>"2023-09-24 23:45",
    :temp_c=>18.9,
    :temp_f=>66.0,
    :is_day=>0,
    :condition=>{:text=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/night/116.png", :code=>1003},
    :wind_mph=>5.6,
    :wind_kph=>9.0,
    :wind_degree=>50,
    :wind_dir=>"NE",
    :pressure_mb=>1017.0,
    :pressure_in=>30.04,
    :precip_mm=>0.0,
    :precip_in=>0.0,
    :humidity=>78,
    :cloud=>25,
    :feelslike_c=>18.9,
    :feelslike_f=>66.0,
    :vis_km=>16.0,
    :vis_miles=>9.0,
    :uv=>1.0,
    :gust_mph=>7.6,
    :gust_kph=>12.2}

    current_forecast = CurrentForecast.new(attrs)

    expect(current_forecast).to be_a CurrentForecast
    expect(current_forecast.last_updated).to eq("2023-09-24 23:45")
    expect(current_forecast.temperature).to eq(66.0)
    expect(current_forecast.feels_like).to eq(66.0)
    expect(current_forecast.humidity).to eq(78)
    expect(current_forecast.uvi).to eq(1.0)
    expect(current_forecast.visibility).to eq(9.0)
    expect(current_forecast.condition).to eq("Partly cloudy")
    expect(current_forecast.icon).to eq("//cdn.weatherapi.com/weather/64x64/night/116.png")
  end
end