require "rails_helper"


descibe "User can use search bar" do

  before(:each) do

  end


  it "finds top 10 closest stations" do
    # As a user    <--- logged in ?

    # When I visit "/"
    visit '/'

    # And I fill in the search form with 80203 (Note: Use the existing search form)
    # ^^^ search in application.html.erb
    # page.find('#q')
    fill_in 'q', with: 80203

    # And I click "Locate"
    click_button 'Locate'

    # Then I should be on page "/search"
    expect(page).to have_current_path(search_path)

    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    list = page.find_all('.station')
    expect(list.count).to eq(10)
    # test closest?
    # test within 6 miles
    # test sort by distance

    # And the stations should be limited to Electric and Propane


    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    station = list.first
    expect(station).to have_content(@nearest.name)
    expect(station).to have_content(@nearest.address)
    expect(station).to have_content(@nearest.fuel)
    expect(station).to have_content(@nearest.distance)
    expect(station).to have_content(@nearest.access)
  end

end
