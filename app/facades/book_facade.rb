class BookFacade
  def self.get_books(location, quantity)
    service = BookService.new
    response = service.get_books(location, quantity)

    response[:docs].map do |data|
    Book.new(title: data[:title],
                isbn: data[:isbn])
    end
  end
end