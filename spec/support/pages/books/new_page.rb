require_relative '../general_page'
require_relative 'partials/book_form'

module Books
  class NewPage < ::GeneralPage
    set_url '/books/new'

    section :form, BookForm, '#book-form'
  end
end
