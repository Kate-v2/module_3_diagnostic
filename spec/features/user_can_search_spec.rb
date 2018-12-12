require "rails_helper"


describe "User can use search bar" do

  before(:each) do
    stub_station_api_request
  end


  it "finds top 10 closest stations" do
    visit '/'

    fill_in 'q', with: 80203

    click_button 'Locate'

    # expect(page).to have_current_path(search_path)
    # TODO -  expected "/search?utf8=%E2%9C%93&q=80203&commit=Locate" to equal "/search"

    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    list = page.find_all('.station')
    first = list.first
    last  = list.last

    expect(list.count).to eq(10)
    # expect(first).to have_content( x miles away )
    # expect(last).to  have_content( x miles away )
    # I'd rather demonstrate first < last

    # And the stations should be limited to Electric and Propane
    # demonstrate P & E
    # demonstrate not others ?

    expect(first).to have_content(@nearest.name)
    expect(first).to have_content(@nearest.address)
    expect(first).to have_content(@nearest.fuel)
    expect(first).to have_content(@nearest.distance)
    expect(first).to have_content(@nearest.access)
  end

end
