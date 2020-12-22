class Trip < ApplicationRecord
  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def average_distance
    trails.average(:length).to_f
  end

  def longest_trail
    trails.order(:length).last
  end

  def shortest_trail
    trails.order(:length).first
  end

  def total_length
    trails.sum(:length)
  end


end
