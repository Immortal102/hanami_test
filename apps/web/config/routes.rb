# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
get  '/', to: 'home#index'
get  '/books', to: 'books#index', as: :books
get  '/books/new', to: 'books#new', as: :new_book
post '/books', to: 'books#create', as: :create_book
get  '/books/:id/edit', to: 'books#edit', as: :edit_book
put  '/books/:id', to: 'books#update', as: :update_book
