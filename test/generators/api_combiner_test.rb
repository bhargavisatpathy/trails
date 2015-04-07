require "test_helper"

class ApiCombinerTest < ActiveSupport::TestCase
  def test_it_returns_species_for_lat_lng
    trail = Trail.create(id: 1,
                         name: "Indian Falls Trail (Alabama)",
                         city: "Fort Payne",
                         state: "Alabama",
                         country: "United States",
                         lat: 35,
                         lng: 100,
                         description: nil,
                         directions: "DE SOTO STATE PARK&lt;br /&gt;&lt;br ",
                         created_at: "2015-04-07 20:14:51",
                         updated_at: "2015-04-07 20:14:51",
                         unique_id: 6039)
    result = ApiCombiner.get_species(trail.id)
    binding.pry
    assert result
  end
end
