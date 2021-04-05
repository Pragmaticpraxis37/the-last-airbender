require 'rails_helper'

describe 'search page' do
  it 'displays information after a search has been submitted' do
    visit root_path

    select 'Fire Nation',  from: 'nation'

    click_on 'Search For Members'

    save_and_open_page

    expect(page).to have_content("")
  end
end
