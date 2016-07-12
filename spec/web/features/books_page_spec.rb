require 'features_helper'

describe 'books page' do
  let(:index_page) { Books::IndexPage.new }
  let(:new_page) { Books::NewPage.new }

  describe 'index' do
    before { index_page.load }

    it 'successfully loads' do
      expect(index_page).to be_displayed
    end

    it 'contains correct header' do
      expect(index_page).to have_content('Bookshelf')
    end

    it 'contains correct subheader' do
      expect(index_page).to have_content('Books list')
    end

    it 'shows no books placeholder' do
      expect(index_page).to have_content('There are no books yet')
    end

    context 'when there are some books present' do
      let!(:book1) { create :book, title: 'Book1', author: 'first_author' }
      let!(:book2) { create :book, title: 'Book2', author: 'second_author' }

      before { index_page.load }

      it 'shows books list' do
        expect(index_page.books.size).to eq(2)
      end

      it 'contains correct books content' do
        expect(index_page.books.map(&:text)).to match_array(['Book1 ( first_author )', 'Book2 ( second_author )'])
      end

      it 'does not show no books placeholder' do
        expect(index_page).to_not have_content('There are no books yet')
      end
    end
  end

  describe 'new' do
    before { new_page.load }

    it 'allows to create new book' do
      new_page.form.title.set 'Some title'
      new_page.form.author.set 'Some author'
      new_page.form.submit.click

      expect(index_page).to be_displayed
      expect(index_page.books.first.text).to eq('Some title ( Some author )')
    end

    it 'validates title presence' do
      new_page.form.author.set 'Some author'
      new_page.form.submit.click

      expect(new_page).to be_displayed
    end

    it 'validates author presence' do
      new_page.form.title.set 'Some title'
      new_page.form.submit.click

      expect(new_page).to be_displayed
    end
  end
end
