require "test_helper"

class TrailsServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = TrailsService.new
  end

  test "#trails" do
    VCR.use_cassette("trails_service_api") do
      trails = service.get_all_trails
      first_trail = trails.first

      assert_equal 80, trails.count
      assert_equal "Ogallala", first_trail["city"]
      assert_equal "Nebraska", first_trail["state"]
      assert_equal "Lake McConaughy State Recreation Area", first_trail["name"]
      assert_equal 17975, first_trail["unique_id"]
      assert_equal 47.78097, first_trail["lat"]
      assert_equal -120.26159, first_trail["lon"]
      assert_equal "mountain biking",
                   first_trail["activities"].first["activity_type_name"]
      assert_equal "http://www.singletracks.com/item.php?c=1&i=9812",
                   first_trail["activities"].first["url"]
      assert_equal 6.0, first_trail["activities"].first["length"]
    end
  end

  test "#trails activities" do
    VCR.use_cassette("trails_service_api_activities") do
      trails = service.get_all_trails
      second_trail = trails.second
      trail_activities = second_trail["activities"]

      assert_equal 2, trail_activities.count
      assert_equal "hiking", trail_activities.first["activity_type_name"]
    end
  end
end
