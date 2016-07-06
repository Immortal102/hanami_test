require 'features_helper'

describe 'books page' do
  let(:index_page) { Books::IndexPage.new }

  describe 'index' do
    before { index_page.load }

    it 'successfully loads' do
      expect(index_page).to be_displayed
    end

    it 'shows books list' do
      expect(index_page.books.size).to eq(2)
    end
  end
end
