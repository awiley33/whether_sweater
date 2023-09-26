class BookFacade
  def self.get_books(location, quantity)
    service = BookService.new
    response = service.get_books(location, quantity)
    quantity_found = response[:numFound]
    response[:docs].map do |data|
    Book.new(title: data[:title],
              isbn: data[:isbn],
              quantity_found: quantity_found)
    end
  end

end