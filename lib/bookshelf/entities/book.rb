class Book
  include Hanami::Entity

  attributes :author, :title

  def new_record?
    BookRepository.find(id).nil?
  end
end
