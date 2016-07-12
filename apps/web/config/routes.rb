# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
get '/', to: 'home#index'
get '/books', to: 'books#index', as: :books
get '/books/new', to: 'books#new'
post '/books', to: 'books#create', as: :create_book
