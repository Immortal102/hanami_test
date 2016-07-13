module Web::Controllers::Books
  class Update
    include Web::Action

    expose :book
    params BookParams

    def call(params)
      @book = BookRepository.find(params[:id])
      @book.update(params[:book])

      if params.valid?
        BookRepository.update(@book)
        redirect_to routes.books_path
      end
    end
  end
end
