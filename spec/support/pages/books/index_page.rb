require_relative '../general_page'

module Books
  class IndexPage < ::GeneralPage
    set_url '/books'

    elements :books, '#books .book'
  end
end
