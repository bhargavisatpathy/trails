require "test_helper"

class TrailTest < ActiveSupport::TestCase
  def setup
    trail1 = Trail.create(name: "howdy hike",
                          city: "Denver",
                         state: "CO",
                       country: "United States",
                           lat: 10.323,
                           lng: -103.23,
                   description: "A darn good time",
                    directions: "take a right")
    trail2 = Trail.create(name: "sunny bike",
                          city: "Denver",
                         state: "WA",
                       country: "United States",
                           lat: 11.323,
                           lng: -104.23,
                   description: "A darn good time",
                    directions: "take a right")
    trail3 = Trail.create(name: "nature bike",
                          city: "Seatle",
                         state: "WA",
                       country: "United States",
                           lat: 3.323,
                           lng: -99.23,
                   description: "A darn good time",
                    directions: "take a right")
  end
  
  test "filters by state" do
    searched_trails = Trail.filter_by_state("CO")
    assert_equal "howdy hike", searched_trails.first.name
    assert_equal 1, searched_trails.count
  end

  test "filter by lat" do
    lat_searched_trails = Trail.filter_by_lat(11)
    assert_equal "howdy hike", lat_searched_trails.first.name
    assert_equal 2, lat_searched_trails.count
  end

  test "filter by long" do
    long_searched_trails = Trail.filter_by_long(-104)
    assert_equal "howdy hike", long_searched_trails.first.name
    assert_equal 2, long_searched_trails.count
  end
end
