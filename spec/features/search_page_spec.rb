require 'rails_helper'

describe 'search page' do
  it 'displays information after a search has been submitted' do
    visit root_path

    select 'Fire Nation',  from: 'nation'

    click_on 'Search For Members'

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Total Number of People: 97")

    expect(page).to have_content("Chan (Fire Nation admiral)")
    expect(page).to have_content("Ozai")
    expect(page).to have_content("Earth Kingdom")
    expect(page).to have_content("Fire Nation Navy")

    expect(page).to have_content("Fire Nation train conductor")
    expect(page).to have_content("Aang")
    expect(page).to have_content("Combustion Man")
    expect(page).to have_content("Fire Nation Fire Nation train")
    expect(page).to have_content("None")
    expect(page).to have_no_content("[]")
  end
end
