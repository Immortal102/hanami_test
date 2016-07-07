require_relative '../general_page'

module Books
  class NewPage < ::GeneralPage
    set_url '/books/new'

    class BookForm < SitePrism::Section
      element :title, '#book_title'
      element :author, '#book_author'
      element :submit, '[name="commit"]'
    end

    section :form, BookForm, '#new_book'
  end
end
