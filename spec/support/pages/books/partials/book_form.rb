module Books
  class BookForm < SitePrism::Section
    element :title, '[name*="title"]'
    element :author, '[name*="author"]'
    element :submit, '[name="commit"]'
  end
end
