require 'rails_helper'

RSpec.describe DailyForecast do
  it "exists and has attributes" do
    attrs = {
      :date=>"2023-09-24",
      :date_epoch=>1695513600,
      :day=>
      {:maxtemp_c=>28.6,
      :maxtemp_f=>83.5,
      :mintemp_c=>13.9,
      :mintemp_f=>57.0,
      :avgtemp_c=>20.2,
      :avgtemp_f=>68.4,
      :maxwind_mph=>7.4,
      :maxwind_kph=>11.9,
      :totalprecip_mm=>0.0,
      :totalprecip_in=>0.0,
      :totalsnow_cm=>0.0,
      :avgvis_km=>10.0,
      :avgvis_miles=>6.0,
      :avghumidity=>66.0,
      :daily_will_it_rain=>0,
      :daily_chance_of_rain=>0,
      :daily_will_it_snow=>0,
      :daily_chance_of_snow=>0,
      :condition=>{:text=>"Sunny", :icon=>"//cdn.weatherapi.com/weather/64x64/day/113.png", :code=>1000},
      :uv=>6.0,
      :air_quality=>
        {:co=>260.08400000000006,
        :no2=>9.308,
        :o3=>88.12799999999999,
        :so2=>1.8760000000000003,
        :pm2_5=>8.988,
        :pm10=>9.832,
        :"us-epa-index"=>1,
        :"gb-defra-index"=>1}},
    :astro=>
      {:sunrise=>"07:27 AM",
      :sunset=>"07:32 PM",
      :moonrise=>"05:04 PM",
      :moonset=>"01:13 AM",
      :moon_phase=>"Waxing Gibbous",
      :moon_illumination=>"63",
      :is_moon_up=>1,
      :is_sun_up=>0}
  }

    daily_forecast = DailyForecast.new(attrs)
    expect(daily_forecast).to be_a DailyForecast
    expect(daily_forecast.date).to eq("2023-09-24")
    expect(daily_forecast.sunrise).to eq("07:27 AM")
    expect(daily_forecast.sunset).to eq("07:32 PM")
    expect(daily_forecast.max_temp).to eq(83.5)
    expect(daily_forecast.min_temp).to eq(57.0)
    expect(daily_forecast.condition).to eq("Sunny")
    expect(daily_forecast.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
  end
end