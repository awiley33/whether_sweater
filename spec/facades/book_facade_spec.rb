require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  describe "class methods" do
    it "#get_books" do
      books = BookFacade.get_books("bloomington,il", 7)
      books.each do |book|
        expect(book).to be_a Book
      end
    end
  end
end