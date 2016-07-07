# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
get '/', to: 'home#index'
get '/books', to: 'books#index'
get '/books/new', to: 'books#new', as: :new_book
