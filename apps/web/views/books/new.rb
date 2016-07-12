module Web::Views::Books
  class New
    include Web::View

    def form
      form_for :book, routes.create_book_path do
        div class: 'input' do
          label      :title
          text_field :title
        end

        div class: 'input' do
          label      :author
          text_field :author
        end

        div class: 'control' do
          submit 'Create', name: :commit
        end
      end
    end
  end
end
