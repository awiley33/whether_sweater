class Book
  attr_reader :title,
              :isbn,
              :quantity_found
  def initialize(data)
    @title = data[:title]
    @isbn = data[:isbn]
    @quantity_found = data[:quantity_found]
  end
end