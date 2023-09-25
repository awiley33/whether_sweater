require 'rails_helper'

RSpec.describe "Book Service", :vcr do
  describe "happy path" do
    it "can get books related to destination" do
      get "/api/v0/book-search?location=denver,co&quantity=5"
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data]).to be_a Hash
      expect(parsed_response[:data][:attributes]).to be_a Hash

      expect(parsed_response[:data][:attributes]).to have_key(:destination)
      expect(parsed_response[:data][:attributes][:destination]).to be_a String

      expect(parsed_response[:data][:attributes]).to have_key(:forecast)
      expect(parsed_response[:data][:attributes][:forecast]).to be_a Hash

      expect(parsed_response[:data][:attributes]).to have_key(:total_books_found)
      expect(parsed_response[:data][:attributes][:destination]).to be_an Integer

      expect(parsed_response[:data][:attributes]).to have_key(:books)
      expect(parsed_response[:data][:attributes][:destination]).to be_an Array
      expect(parsed_response[:data][:attributes][:destination].count).to eq(5)
    end
  end
end
