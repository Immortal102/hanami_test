require_relative '../general_page'

module Books
  class IndexPage < ::GeneralPage
    set_url '/books'

    class BookRow < SitePrism::Section
      element :title, 'td:nth-child(1)'
      element :author, 'td:nth-child(2)'
      element :edit, 'td:nth-child(3) a:first-child'
      element :delete, 'td:nth-child(3) a:last-child'
    end

    sections :books, BookRow, '#books table tr'
  end
end
