class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :unix_time

  def initialize(data)
    @id = nil
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = data[:travel_time]
    @unix_time = data[:unix_time]
  end

  def readable_eta
    if @unix_time
      unix_eta = Time.now.to_i + @unix_time # calculates precise time of eta
      Time.at(unix_eta).to_datetime # converts to readable value
    end
  end

  def eta_day
    if @unix_time
      readable_eta.strftime[0,10] # pulls out YYYY-DD-MM
    end
  end

  def eta_hour
    if @unix_time
      if readable_eta.min > 30
        readable_eta.hour + 1 # rounds up to next hour
      else
        readable_eta.hour # rounds down to current hour
      end
    end
  end
end