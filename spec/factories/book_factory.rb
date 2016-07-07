FactoryGirl.define do
  factory :book do
    title 'Test book'
    author 'Test author'

    to_create { |instance| BookRepository.create(instance) }
  end
end
