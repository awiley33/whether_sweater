require 'rails_helper'

RSpec.describe HourlyForecast do
  it "exists and has attributes" do
    attrs = { :time=>"2023-09-24 00:00",
    :temp_c=>17.6,
    :temp_f=>63.7,
    :is_day=>0,
    :condition=>{:text=>"Clear", :icon=>"//cdn.weatherapi.com/weather/64x64/night/113.png", :code=>1000},
    }

    hourly_forecast = HourlyForecast.new(attrs)
    
    expect(hourly_forecast).to be_an HourlyForecast
    expect(hourly_forecast.time).to eq("00:00")
    expect(hourly_forecast.temperature).to eq(63.7)
    expect(hourly_forecast.conditions).to eq("Clear")
    expect(hourly_forecast.icon).to eq("//cdn.weatherapi.com/weather/64x64/night/113.png")
  end
end