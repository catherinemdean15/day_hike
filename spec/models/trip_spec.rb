require 'rails_helper'

describe Trip, type: :model do
  describe  'methods' do
    it "average_distance" do
      @trip_1 = create(:trip)
      @trail_1 = create(:trail)
      @trail_2 = create(:trail)
      @trail_3 = create(:trail)

      TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_2.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_3.id, trip_id: @trip_1.id)

      expect(@trip_1.average_distance).to eq(@trip_1.trails.average(:length))

    end


    it "longest_trail" do
      @trip_1 = create(:trip)
      @trail_1 = create(:trail)
      @trail_2 = create(:trail)
      @trail_3 = create(:trail)

      TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_2.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_3.id, trip_id: @trip_1.id)

      expect(@trip_1.longest_trail).to eq(@trail_3)

    end

    it "shortest_trail" do
      @trip_1 = create(:trip)
      @trail_1 = create(:trail)
      @trail_2 = create(:trail)
      @trail_3 = create(:trail)

      TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_2.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_3.id, trip_id: @trip_1.id)

      expect(@trip_1.shortest_trail).to eq(@trail_1)

    end

    it "total_length" do
      @trip_1 = create(:trip)
      @trail_1 = create(:trail)
      @trail_2 = create(:trail)
      @trail_3 = create(:trail)

      TrailTrip.create(trail_id: @trail_1.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_2.id, trip_id: @trip_1.id)
      TrailTrip.create(trail_id: @trail_3.id, trip_id: @trip_1.id)

      expect(@trip_1.total_length).to eq(21)

    end
  end

end
