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
        expect(index_page.books.map { |b| b.title.text }).to match_array(['Book1', 'Book2'])
        expect(index_page.books.map { |b| b.author.text }).to match_array(['( first_author )', '( second_author )'])
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
      expect(index_page.books.first.title.text).to eq('Some title')
      expect(index_page.books.first.author.text).to eq('( Some author )')
    end

    it 'validates title presence' do
      new_page.form.author.set 'Some author'
      new_page.form.submit.click

      expect(new_page).to have_content('title must be present')
    end

    it 'validates author presence' do
      new_page.form.title.set 'Some title'
      new_page.form.submit.click

      expect(new_page).to have_content('author must be present')
    end
  end

  describe 'edit' do
    let(:book) { create :book, title: 'title', author: 'author' }
    let(:edit_page) { Books::EditPage.new }

    before { edit_page.load book_id: book.id }

    it 'allows to update book' do
      edit_page.form.title.set 'Updated title'
      edit_page.form.author.set 'Updated author'
      edit_page.form.submit.click

      expect(index_page.books.map{ |b| b.title.text }).to include('Updated title')
      expect(index_page.books.map{ |b| b.author.text }).to include('( Updated author )')
    end

    it 'validates title presence' do
      edit_page.form.title.set ''
      edit_page.form.author.set 'Updated author'
      edit_page.form.submit.click

      expect(edit_page).to have_content('title must be present')
    end

    it 'validates author presence' do
      edit_page.form.title.set 'Updated title'
      edit_page.form.author.set ''
      edit_page.form.submit.click

      expect(edit_page).to have_content('author must be present')
    end
  end

  describe 'delete' do
    let!(:book) { create :book }

    it 'allows to delete book' do
      index_page.load
      expect { index_page.books.first.delete.click }.to change {
        index_page.books.count
      }.by(-1)
    end
  end
end
