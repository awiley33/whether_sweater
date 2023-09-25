class ForecastSerializer
  def initialize(current_weather, daily_weather, hourly_weather)
    @current_weather = current_weather
    @daily_weather = daily_weather
    @hourly_weather = hourly_weather
  end
  def as_json
    {
  "data": {
    "id": "null",
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "last_updated": @current_weather.last_updated,
        "temperature": @current_weather.temperature,
        "feels_like": @current_weather.feels_like,
        "humidity": @current_weather.humidity,
        "uvi": @current_weather.uvi,
        "visibility": @current_weather.visibility,
        "condition": @current_weather.condition,
        "icon": @current_weather.icon
      },
      "daily_weather": [
        {
          "date": @daily_weather[0].date,
          "sunrise": @daily_weather[0].sunrise,
          "sunset": @daily_weather[0].sunset,
          "max_temp": @daily_weather[0].max_temp,
          "min_temp": @daily_weather[0].min_temp,
          "condition": @daily_weather[0].condition,
          "icon": @daily_weather[0].icon
        },
        {
          "date": @daily_weather[1].date,
          "sunrise": @daily_weather[1].sunrise,
          "sunset": @daily_weather[1].sunset,
          "max_temp": @daily_weather[1].max_temp,
          "min_temp": @daily_weather[1].min_temp,
          "condition": @daily_weather[1].condition,
          "icon": @daily_weather[1].icon
        },
        {
          "date": @daily_weather[2].date,
          "sunrise": @daily_weather[2].sunrise,
          "sunset": @daily_weather[2].sunset,
          "max_temp": @daily_weather[2].max_temp,
          "min_temp": @daily_weather[2].min_temp,
          "condition": @daily_weather[2].condition,
          "icon": @daily_weather[2].icon
        },
        {
          "date": @daily_weather[3].date,
          "sunrise": @daily_weather[3].sunrise,
          "sunset": @daily_weather[3].sunset,
          "max_temp": @daily_weather[3].max_temp,
          "min_temp": @daily_weather[3].min_temp,
          "condition": @daily_weather[3].condition,
          "icon": @daily_weather[3].icon
        },
        {
          "date": @daily_weather[4].date,
          "sunrise": @daily_weather[4].sunrise,
          "sunset": @daily_weather[4].sunset,
          "max_temp": @daily_weather[4].max_temp,
          "min_temp": @daily_weather[4].min_temp,
          "condition": @daily_weather[4].condition,
          "icon": @daily_weather[4].icon
        }
      ],
      "hourly_weather": [
        {
          "time": @hourly_weather[0].time,
          "temperature": @hourly_weather[0].temperature,
          "conditions": @hourly_weather[0].conditions,
          "icon": @hourly_weather[0].icon,
        },
        {
          "time": @hourly_weather[1].time,
          "temperature": @hourly_weather[1].temperature,
          "conditions": @hourly_weather[1].conditions,
          "icon": @hourly_weather[1].icon,
        },
        {
          "time": @hourly_weather[2].time,
          "temperature": @hourly_weather[2].temperature,
          "conditions": @hourly_weather[2].conditions,
          "icon": @hourly_weather[2].icon,
        },
        {
          "time": @hourly_weather[3].time,
          "temperature": @hourly_weather[3].temperature,
          "conditions": @hourly_weather[3].conditions,
          "icon": @hourly_weather[3].icon,
        },
        {
          "time": @hourly_weather[4].time,
          "temperature": @hourly_weather[4].temperature,
          "conditions": @hourly_weather[4].conditions,
          "icon": @hourly_weather[4].icon,
        },
        {
          "time": @hourly_weather[5].time,
          "temperature": @hourly_weather[5].temperature,
          "conditions": @hourly_weather[5].conditions,
          "icon": @hourly_weather[5].icon,
        },
        {
          "time": @hourly_weather[6].time,
          "temperature": @hourly_weather[6].temperature,
          "conditions": @hourly_weather[6].conditions,
          "icon": @hourly_weather[6].icon,
        },
        {
          "time": @hourly_weather[7].time,
          "temperature": @hourly_weather[7].temperature,
          "conditions": @hourly_weather[7].conditions,
          "icon": @hourly_weather[7].icon,
        },
        {
          "time": @hourly_weather[8].time,
          "temperature": @hourly_weather[8].temperature,
          "conditions": @hourly_weather[8].conditions,
          "icon": @hourly_weather[8].icon,
        },
        {
          "time": @hourly_weather[9].time,
          "temperature": @hourly_weather[9].temperature,
          "conditions": @hourly_weather[9].conditions,
          "icon": @hourly_weather[9].icon,
        },
        {
          "time": @hourly_weather[10].time,
          "temperature": @hourly_weather[10].temperature,
          "conditions": @hourly_weather[10].conditions,
          "icon": @hourly_weather[10].icon,
        },
        {
          "time": @hourly_weather[11].time,
          "temperature": @hourly_weather[11].temperature,
          "conditions": @hourly_weather[11].conditions,
          "icon": @hourly_weather[11].icon,
        },
        {
          "time": @hourly_weather[12].time,
          "temperature": @hourly_weather[12].temperature,
          "conditions": @hourly_weather[12].conditions,
          "icon": @hourly_weather[12].icon,
        },
        {
          "time": @hourly_weather[13].time,
          "temperature": @hourly_weather[13].temperature,
          "conditions": @hourly_weather[13].conditions,
          "icon": @hourly_weather[13].icon,
        },
        {
          "time": @hourly_weather[14].time,
          "temperature": @hourly_weather[14].temperature,
          "conditions": @hourly_weather[14].conditions,
          "icon": @hourly_weather[14].icon,
        },
        {
          "time": @hourly_weather[15].time,
          "temperature": @hourly_weather[15].temperature,
          "conditions": @hourly_weather[15].conditions,
          "icon": @hourly_weather[15].icon,
        },
        {
          "time": @hourly_weather[16].time,
          "temperature": @hourly_weather[16].temperature,
          "conditions": @hourly_weather[16].conditions,
          "icon": @hourly_weather[16].icon,
        },
        {
          "time": @hourly_weather[17].time,
          "temperature": @hourly_weather[17].temperature,
          "conditions": @hourly_weather[17].conditions,
          "icon": @hourly_weather[17].icon,
        },
        {
          "time": @hourly_weather[18].time,
          "temperature": @hourly_weather[18].temperature,
          "conditions": @hourly_weather[18].conditions,
          "icon": @hourly_weather[18].icon,
        },
        {
          "time": @hourly_weather[19].time,
          "temperature": @hourly_weather[19].temperature,
          "conditions": @hourly_weather[19].conditions,
          "icon": @hourly_weather[19].icon,
        },
        {
          "time": @hourly_weather[20].time,
          "temperature": @hourly_weather[20].temperature,
          "conditions": @hourly_weather[20].conditions,
          "icon": @hourly_weather[20].icon,
        },
        {
          "time": @hourly_weather[21].time,
          "temperature": @hourly_weather[21].temperature,
          "conditions": @hourly_weather[21].conditions,
          "icon": @hourly_weather[21].icon,
        },
        {
          "time": @hourly_weather[22].time,
          "temperature": @hourly_weather[22].temperature,
          "conditions": @hourly_weather[22].conditions,
          "icon": @hourly_weather[22].icon,
        },
        {
          "time": @hourly_weather[23].time,
          "temperature": @hourly_weather[23].temperature,
          "conditions": @hourly_weather[23].conditions,
          "icon": @hourly_weather[23].icon,
        },
      ]
    }
  }
}
  end
end