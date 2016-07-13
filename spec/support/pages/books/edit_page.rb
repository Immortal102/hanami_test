require_relative '../general_page'
require_relative 'partials/book_form'

module Books
  class EditPage < ::GeneralPage
    set_url '/books/{book_id}/edit'

    section :form, BookForm, '#book-form'
  end
end
