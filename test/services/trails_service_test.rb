require "test_helper"

class TrailsServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = TrailsService.new
  end

  test "#trails" do
    VCR.use_cassette("trails_service_api") do
      trails = service.trails
      first_trail = trails.first

      assert_equal "San Francisco", first_trail["city"]
      assert_equal "California", first_trail["state"]
      assert_equal "Mt. Sutro Historic Trail", first_trail["name"]
      assert_equal 664, first_trail["unique_id"]
      assert_equal 37.75756, first_trail["lat"]
      assert_equal -122.45615, first_trail["lon"]
      assert_equal "mountain biking",
                   first_trail["activities"].first["activity_type_name"]
      assert_equal "http://www.singletracks.com/item.php?c=1&i=5180",
                   first_trail["activities"].first["url"]
      assert_equal 2, first_trail["activities"].first["length"]
      assert_equal "http://images.singletracks.com/2013/12/image-29.jpg",
                   first_trail["activities"].first["thumbnail"]
    end
  end
end
