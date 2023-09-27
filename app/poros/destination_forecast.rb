class DestinationForecast
  attr_reader :datetime,
              :temperature,
              :condition
  
  def initialize(data)
    @datetime = data[:datetime]
    @temperature = data[:temperature]
    @condition = data[:condition]
  end
end