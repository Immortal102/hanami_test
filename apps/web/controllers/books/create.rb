module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params BookParams

    def call(params)
      @book = Book.new(params[:book])
      if params.valid?
        BookRepository.create(@book)
        redirect_to routes.books_path
      end
    end
  end
end
