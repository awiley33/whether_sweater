require "rails_helper"

RSpec.describe "Users API" do
  describe "user registration" do
    it "can create a user" do
      params = ({
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      })

      post "/api/v0/users", params: params, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_user = User.last
      expect(created_user.email).to eq("whatever@example.com")
      expect(created_user.api_key).to be_truthy
    end

    it "does not create a new user and returns status code 400 if invalid params passed" do
      params = ({
        "password": "password",
        "password_confirmation": "password"
      })
      request = post "/api/v0/users", params: params, as: :json

      expect{ request }.to_not change(User, :count)
      expect{ User.create!(params) }.to raise_error(ActiveRecord::RecordInvalid)
      expect(response).to have_http_status(400)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:errors].first[:detail]).to eq("Validation failed: Email can't be blank")
    end
  end

  describe "login" do
    before do
      params = ({
        "email": "anna@example.com",
        "password": "luca",
        "password_confirmation": "luca"
      })
      post "/api/v0/users", params: params, as: :json
      @user = User.last
    end

    it "can authenticate a user at login" do
      params = {
      "email": "anna@example.com",
      "password": "luca"
      }
      post "/api/v0/sessions", params: params, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:attributes][:email]).to eq(@user.email)
      expect(parsed_response[:data][:attributes][:api_key]).to eq(@user.api_key)
    end

    it "does not allow login with bad credentials" do
      params = {
      "email": "anna@example.com",
      "password": "bob"
      }
      post "/api/v0/sessions", params: params, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end
