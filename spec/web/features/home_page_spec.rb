require 'features_helper'

describe 'home page' do
  let(:home_page) { HomePage.new }

  before { home_page.load }

  it 'successfully visited' do
    expect(home_page).to be_displayed
  end

  it 'contains correct header' do
    expect(home_page).to have_content('Bookshelf')
  end
end
