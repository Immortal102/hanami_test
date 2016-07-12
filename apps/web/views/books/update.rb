module Web::Views::Books
  class Update
    include Web::View
    include BookForm
    template 'books/edit'
  end
end
