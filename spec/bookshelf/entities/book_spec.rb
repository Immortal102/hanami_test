require 'spec_helper'

describe Book do
  describe 'attributes' do
    let(:book) { Book.new(author: 'Test author', title: 'Test title') }

    it 'successfully initialized with author attribute' do
      expect(book.author).to eq('Test author')
    end

    it 'successfully initialized with title attribute' do
      expect(book.title).to eq('Test title')
    end
  end
end
