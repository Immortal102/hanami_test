require_relative '../general_page'

module Books
  class NewPage < ::GeneralPage
    set_url '/books/new'

    class BookForm < SitePrism::Section
      element :title, '[name*="title"]'
      element :author, '[name*="author"]'
      element :submit, '[name="commit"]'
    end

    section :form, BookForm, '#book-form'
  end
end
