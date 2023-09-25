require 'rails_helper'

RSpec.describe LocationFacade, :vcr do
  describe "class methods" do
    it "returns city coordinates" do
      location = LocationFacade.get_coordinates("chicago,il")
      expect(location).to be_a Location
    end
  end
end