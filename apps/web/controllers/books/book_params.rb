class BookParams < Web::Action::Params
  param :id
  param :book do
    param :title,  presence: true
    param :author, presence: true
  end
end
