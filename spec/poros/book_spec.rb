require 'rails_helper'

RSpec.describe Book do
  it "exists and has attributes" do
    data = {
      "quantity_found": 150,
      "key": "/works/OL8503198W",
      "type": "work",
      "seed": [
          "/books/OL10909613M",
          "/works/OL8503198W",
          "/authors/OL2843451A"
      ],
      "title": "Denver, Co",
      "title_suggest": "Denver, Co",
      "title_sort": "Denver, Co",
      "edition_count": 1,
      "edition_key": [
          "OL10909613M"
      ],
      "publish_date": [
          "January 2001"
      ],
      "publish_year": [
          2001
      ],
      "first_publish_year": 2001,
      "isbn": [
          "0762507845",
          "9780762507849"
      ],
      "last_modified_i": 1338943517,
      "ebook_count_i": 0,
      "ebook_access": "no_ebook",
      "has_fulltext": false,
      "public_scan_b": false,
      "publisher": [
          "Universal Map Enterprises"
      ],
      "language": [
          "eng"
      ],
      "author_key": [
          "OL2843451A"
      ],
      "author_name": [
          "Universal Map"
      ],
      "publisher_facet": [
          "Universal Map Enterprises"
      ],
      "_version_": 1767942895778660352,
      "author_facet": [
          "OL2843451A Universal Map"
      ]
  }
    book = Book.new(data)

    expect(book).to be_a Book
    expect(book.isbn).to eq([
      "0762507845",
      "9780762507849"
    ])
    expect(book.title).to eq("Denver, Co")
    expect(book.quantity_found).to eq(150)
  end
end