require 'features_helper'

describe 'books page' do
  let(:book1) { create :book, title: 'Book1', author: 'first_author' }
  let(:book2) { create :book, title: 'Book2', author: 'second_author' }
  let(:index_page) { Books::IndexPage.new }

  describe 'index' do
    before { index_page.load }

    it 'successfully loads' do
      expect(index_page).to be_displayed
    end

    it 'shows books list' do
      expect(index_page.books.size).to eq(2)
    end

    it 'contains correct header' do
      expect(index_page).to have_content('Bookshelf')
    end

    it 'contains correct subheader' do
      expect(index_page).to have_content('Books list')
    end
  end
end
