module Web::Controllers::Books
  class Create
    include Web::Action

    def call(params)
      BookRepository.create(Book.new(params[:book]))
      redirect_to routes.books_path
    end
  end
end
