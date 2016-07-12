module Web::Views::Books
  class Create
    include Web::View
    include BookForm
    template 'books/new'
  end
end
