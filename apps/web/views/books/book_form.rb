require 'active_support'

module BookForm
extend ActiveSupport::Concern
  included do
    def form(book)
      form_for :book, book.new_record? ?  routes.create_book_path : routes.update_book_path(book.id) do
        div class: 'input' do
          label      :title
          text_field :title, value: book.title
        end

        div class: 'input' do
          label      :author
          text_field :author, value: book.author
        end

        div class: 'control' do
          submit book.new_record? ? 'Create' : 'Update', name: :commit
        end
      end
    end
  end
end
