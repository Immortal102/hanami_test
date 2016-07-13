module Web::Controllers::Books
  class Destroy
    include Web::Action

    def call(params)
      p 'in destroy action'
      BookRepository.delete(BookRepository.find(params[:id]))
      redirect_to routes.books_path
    end
  end
end
