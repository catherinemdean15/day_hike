require 'rails_helper'

RSpec.describe "Trail Show", type: :feature do
  before :each do
    @trip_1 = create(:trip)
    @trip_2 = create(:trip)
    @trip_3 = create(:trip)
    @trail_1 = create(:trail)

    TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_1.id)
    TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_2.id)
    TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_3.id)
  end

  it "shows the name and address of the trail" do
    visit "/trails/#{@trail_1.id}"

    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_1.address)
    expect(page).to have_content(@trail_1.length)

  end

  it "shows the trips and lengths this trail is in" do
    visit "/trails/#{@trail_1.id}"

    expect(page).to have_content(@trip_1.name)
    expect(page).to have_content(@trip_1.total_length)
    expect(page).to have_content(@trip_2.name)
    expect(page).to have_content(@trip_2.total_length)
    expect(page).to have_content(@trip_3.name)
    expect(page).to have_content(@trip_3.total_length)

  end

  it "shows the number of trips the trail is in" do
    visit "/trails/#{@trail_1.id}"

    expect(page).to have_content("Total Trips: 3")

  end

  end
