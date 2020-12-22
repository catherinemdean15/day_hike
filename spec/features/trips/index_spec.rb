require 'rails_helper'

RSpec.describe "Trip Index", type: :model do
  it 'shows the hiking trip names' do
    trip_1 = create(:trip)
    trip_2 = create(:trip)
    trip_3 = create(:trip)

    visit '/trips'
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_2.name)
    expect(page).to have_content(trip_3.name)

  end

  it 'has links to the show pages' do
    trip_1 = create(:trip)
    trip_2 = create(:trip)
    trip_3 = create(:trip)

    visit '/trips'

    expect(page).to have_link("#{trip_1.name}", href: "/trips/#{trip_1.id}")
    expect(page).to have_link("#{trip_2.name}", href: "/trips/#{trip_2.id}")
    expect(page).to have_link("#{trip_3.name}", href: "/trips/#{trip_3.id}")

  end

end
