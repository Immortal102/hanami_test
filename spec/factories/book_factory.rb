FactoryGirl.define do
  factory :book do
    title 'Test book'
    author 'Test author'

    to_create { |instance| book = BookRepository.create(instance); instance.id = book.id }
  end
end
