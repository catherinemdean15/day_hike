require 'rails_helper'

RSpec.describe "Trip Show", type: :feature do
  before :each do
    @trip_1 = create(:trip)
    @trail_1 = create(:trail)
    @trail_2 = create(:trail)
    @trail_3 = create(:trail)

    TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_1.id)
    TrailTrip.create(trail_id: @trail_2.id, trip_id: @trip_1.id)
    TrailTrip.create(trail_id: @trail_3.id, trip_id: @trip_1.id)


  end

  it 'shows a list of trails' do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content(@trip_1.name)
    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_2.name)
    expect(page).to have_content(@trail_3.name)
  end

  it "shows the average hiking distance" do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content("Average Distance: #{@trip_1.average_distance}")
  end

  it "shows the longest trail" do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content("Longest Trail on Trip: #{@trip_1.longest_trail.name}, #{@trip_1.longest_trail.length}")
  end

  it "shows the shortest trail" do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content("Shortest Trail on Trip: #{@trip_1.shortest_trail.name}, #{@trip_1.shortest_trail.length}")
  end

  it "links to trails" do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_link(@trip_1.shortest_trail.name)
    expect(page).to have_link(@trip_1.longest_trail.name)
  end

end
