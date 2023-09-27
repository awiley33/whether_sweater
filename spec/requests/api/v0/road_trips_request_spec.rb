require 'rails_helper'

RSpec.describe "Road Trip Request", :vcr do
  describe "happy path" do
    before do   #this before block logs in a user so the API key can be verified in the happy path request
      params = ({
          "email": "anna@example.com",
          "password": "luca",
          "password_confirmation": "luca"
        })
        post "/api/v0/users", params: params, as: :json
        @user = User.last

      params = {
        "email": "anna@example.com",
        "password": "luca"
        }
        post "/api/v0/sessions", params: params, as: :json
    end

    it "can create a road trip" do
      body = {
        "origin": "Cincinatti,OH",
        "destination": "Chicago,IL",
        "api_key": @user.api_key
      }

      post "/api/v0/road_trip", params: body, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to have_key(:attributes)
      expect(parsed_response[:data][:attributes]).to be_a Hash

      expect(parsed_response[:data][:attributes]).to have_key(:start_city)
      expect(parsed_response[:data][:attributes][:start_city]).to be_a String

      expect(parsed_response[:data][:attributes]).to have_key(:end_city)
      expect(parsed_response[:data][:attributes][:end_city]).to be_a String
    end
  end

  describe "sad path" do
    it "returns a 401 status code and message if invalid api key" do
      body = {
        "origin": "Cincinatti,OH",
        "destination": "Chicago,IL",
        "api_key": "sdSDFSH43ggrGSaA2"
      }

      post "/api/v0/road_trip", params: body, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end